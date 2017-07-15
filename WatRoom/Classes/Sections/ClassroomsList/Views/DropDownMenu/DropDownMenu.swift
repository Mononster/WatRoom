//
//  DropDownMenu.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol DropDownMenuDelegate: UITableViewDelegate {
    func updateInfoBySectionAndRow(section: Int, row: Int)
    func updateListMapViewState(_ isListView: Bool, completion: @escaping () -> ())
}

protocol DropDownMenuDataSource: UITableViewDataSource {
    func numOfMenuCategories() -> Int
    func titleData() -> [String]
    func tableSelectionData() -> [[(String, String)]]
}

protocol MenuDelegate: class {
    func didUpdateFilters()
    func updateListMapViewState(_ isListView: Bool, completion: @escaping () -> ())
}

class SortDropDownTable: UIView {
    
    var tableView: UITableView!
    var categoryButtons = [NavigationButton]()
    // true indicates user opens the menu
    // false means user closed the menu.
    var present = false
    // the menu category user selected.
    var currentSelectedIndex = 0
    var menuBarContainer: UIView!
    var backgroundView: UIView!
    var tableViewOriginFrame: CGRect!
    var mapListButtonWidth: CGFloat = 50
    var btnToScreenMargin: CGFloat = 15
    var menuBarHeight: CGFloat = 40
    
    fileprivate var isShowingMap = false
    fileprivate var mapButton: NavigationButton?
    
    weak var menuDelegate: MenuDelegate?
    
    fileprivate var titleData = ["Building", "Distance", "Time", "Map"]
    
    fileprivate(set) var menuData: [[String]] = [[]]
    
    enum MenuCategory: Int {
        case building
        case distance
        case time
        case map
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        menuBarHeight = frame.height
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        configureMenuData()
    }
    
    private func configureMenuData() {
        let buildings = ClassroomsManager.sharedInstance.buildings.map { $0.abbreviation + " - " + $0.name }
        let distance = ["Less than 50 metres", "Less than 100 metres", "Less than 500 metres"]
        
        let buildingsFilter = Array(repeating: true, count: buildings.count)
        let distanceFilter = Array(repeating: false, count: distance.count)
        
        menuData = [buildings, distance]
        
        ClassroomsManager.sharedInstance.buildingsFilter = buildingsFilter
        ClassroomsManager.sharedInstance.distanceFilter = distanceFilter
    }
    
}

extension SortDropDownTable {
    
    func setupUI() {
        self.backgroundColor = UIColor.clear
        setupTopMenu(numOfCategory: self.titleData.count)
        setupTableView()
        setupBottomLine()
    }
    
    func setupBottomLine() {
        let line = UIView(frame: CGRect(x: 0, y: self.menuBarHeight - 1, width: self.frame.width, height: 1))
        line.backgroundColor = DropDownMenuConfig.seperatorColor
        self.addSubview(line)
    }
    
    func setupTopMenu(numOfCategory: Int) {
        menuBarContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.menuBarHeight))
        menuBarContainer.backgroundColor = UIColor.white
        
        let count: CGFloat = CGFloat(numOfCategory)
        // save mapListButtonWidth
        let categoryTotalWidth: CGFloat = self.frame.width - btnToScreenMargin
        let categoryWidth: CGFloat = categoryTotalWidth / count + 12
        
        let categoryHeight: CGFloat = self.menuBarHeight
        for i in 0..<numOfCategory {
            let categoryButton = NavigationButton.navigationButton(title: titleData[i], imageName: "icon_down_arrow")
            categoryButton.tag = i
            
            let width = i == MenuCategory.map.rawValue ? 60 : categoryWidth
            
            categoryButton.frame = CGRect(x: CGFloat(i) * categoryWidth, y: 0, width: width, height : categoryHeight)
            categoryButton.arrowHeight.constant = i == MenuCategory.map.rawValue ? 20 : 14
            categoryButton.arrowWidth.constant = i == MenuCategory.map.rawValue ? 18 : 12
            
            categoryButton.title.font = UIFont.init(name: "Avenir-Medium", size: 15)
            categoryButton.title.textColor = .gray
            
            categoryButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
            
            menuBarContainer.addSubview(categoryButton)
            
            categoryButtons.append(categoryButton)
            
            if i == MenuCategory.map.rawValue {
                mapButton = categoryButton
                mapButton?.arrow.image = #imageLiteral(resourceName: "icon_map")
                mapButton?.separator.isHidden = true
            }
        }
        
        self.addSubview(menuBarContainer!)
    }
    
    func setupTableView() {
        
        // when we do not present the tableview, we set the height to be 0.
        // the reason we add self.farme.minY is because we want to add tableview
        // at top of our keyWindow.
        
        // 64 for navigation bar
        self.tableView = UITableView(frame: CGRect(x: 0, y: menuBarContainer.frame.height + 64,
                                                   width: self.frame.width, height: 0))
        
        tableViewOriginFrame = tableView.frame
        tableView.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 38
        tableView.autoresizesSubviews = false
        tableView.register(UINib.init(nibName: "DropDownMenuCell", bundle: nil), forCellReuseIdentifier: "DropDownMenuCell")
        tableView.register(UINib.init(nibName: "DropDownMenuTimeCell", bundle: nil), forCellReuseIdentifier: "DropDownMenuTimeCell")
        
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 740, 0)
    }
    
    func cleanUI(){
        
        UIView.animate(withDuration: 0.1, animations: {
            self.tableView.frame = CGRect(x: 0, y : self.tableViewOriginFrame.minY, width : self.frame.width, height: 0)
            }, completion: { (finished) in
        })
        
        UIView.animate(withDuration: 0.1, animations: {
            
            self.backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        }, completion: { (finished) in
            
            self.backgroundView.removeFromSuperview()
            self.tableView.removeFromSuperview()
            // 1. resize the tableview back to origin frame.
            self.tableView.frame = self.tableViewOriginFrame
            
        })
        
        self.categoryButtons[self.currentSelectedIndex].updateArrowDirection()
        
    }
}

extension SortDropDownTable{
    
    @objc func backgroundViewTapped() {
        present = !present
        cleanUI()
        
        menuDelegate?.didUpdateFilters()
    }
    
    func hideViewWithoutAnimation() {
        
        // hide only if selection tableview is presenting.
        if present {
            present = !present
            self.backgroundView.removeFromSuperview()
            self.tableView.removeFromSuperview()
            self.tableView.frame = self.tableViewOriginFrame
            categoryButtons[currentSelectedIndex].updateArrowDirection()
        }
    }
    
    @objc func menuButtonTapped(_ sender: NavigationButton) {
        guard sender.tag != MenuCategory.map.rawValue else {
            mapListViewButtonTapped(sender)
            return
        }
        
        let prevSelectedIndex = currentSelectedIndex
        currentSelectedIndex = sender.tag
        tableView.reloadData()
        var tableViewHeight = CGFloat(tableView.numberOfRows(inSection: 0)) * tableView.rowHeight + 20
        
        if tableViewHeight > UIScreen.main.bounds.height * 3 / 4 {
            tableViewHeight = UIScreen.main.bounds.height * 3 / 4
        }
        
        if currentSelectedIndex == MenuCategory.time.rawValue {
            tableView.isScrollEnabled = false
            tableViewHeight = 270
        } else {
            tableView.isScrollEnabled = true
        }
        
        if prevSelectedIndex != sender.tag && present {
            // when user selects a different category when he does
            // not close the previous category
            currentSelectedIndex = sender.tag
            self.tableView.frame = CGRect(x: 0, y: self.tableViewOriginFrame.minY, width: self.frame.width, height: tableViewHeight)
            tableView.reloadData()
            categoryButtons[prevSelectedIndex].updateArrowDirection()
            categoryButtons[currentSelectedIndex].updateArrowDirection()
            return
        } else {
            present = !present
        }
        
        if present {
            
            // 1. animate backgroundview alpha
            
            // We add backgroundview to key window since we need to also animate the alpha for tabbar
            // notice not the background view frame is related to the keywindow, so we need 64 (navigation bar)
            // more pixels to adjust the frame.
            self.backgroundView = UIView(frame: CGRect(x: 0, y: self.menuBarContainer.frame.height + 64 , width: self.frame.width, height: UIScreen.main.bounds.height))
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
            backgroundView.addGestureRecognizer(tapGesture)
            
            UIApplication.shared.keyWindow!.addSubview(self.backgroundView)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
            })
            
            // 2. animate uitableview.
            UIView.animate(withDuration: 0.2, animations: {
                self.tableView.frame = CGRect(x: 0, y: self.tableViewOriginFrame.minY, width: self.frame.width, height: tableViewHeight)
            }, completion: { (finished) in
                
            })
            
            UIApplication.shared.keyWindow!.addSubview(tableView)
            
            // 3. animate indicator
            categoryButtons[currentSelectedIndex].updateArrowDirection()
        } else {
            cleanUI()
            menuDelegate?.didUpdateFilters()
        }
        
    }
    
    func mapListViewButtonTapped(_ sender: NavigationButton ){
        isShowingMap = !isShowingMap
        
        self.mapButton?.isEnabled = false
        if !isShowingMap {
            sender.title.text = "Map"
            sender.arrow.image = #imageLiteral(resourceName: "icon_map")
            
            self.menuDelegate?.updateListMapViewState(true) {
                self.mapButton?.isEnabled = true
            }
        } else {
            sender.title.text = "List"
            sender.arrow.image = #imageLiteral(resourceName: "icon_list")
            self.menuDelegate?.updateListMapViewState(false) {
                self.mapButton?.isEnabled = true
            }
        }
    }
}


extension SortDropDownTable: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // time filter
        if currentSelectedIndex == 2 {
            return 1
        }
        
        return menuData[currentSelectedIndex].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard currentSelectedIndex != MenuCategory.time.rawValue else { return 280 }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currentSelectedIndex != MenuCategory.time.rawValue else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownMenuTimeCell", for: indexPath) as! DropDownMenuTimeCell
            return cell
        }
        
        let filterData = currentSelectedIndex == MenuCategory.building.rawValue ?
            ClassroomsManager.sharedInstance.buildingsFilter : ClassroomsManager.sharedInstance.distanceFilter
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownMenuCell", for: indexPath) as! DropDownMenuCell
        cell.selectionStyle = .none
        cell.title.text = menuData[currentSelectedIndex][indexPath.row]
        cell.separator.isHidden = indexPath.row == 0 ? true : false
        
        cell.accessoryType = filterData[indexPath.row] ? .checkmark : .none
        
        return cell
        
    }
}

extension SortDropDownTable: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard currentSelectedIndex != MenuCategory.time.rawValue else { return }
        
        let cell = tableView.cellForRow(at: indexPath) as? DropDownMenuCell
        
        var filterData = currentSelectedIndex == MenuCategory.building.rawValue ?
            ClassroomsManager.sharedInstance.buildingsFilter : ClassroomsManager.sharedInstance.distanceFilter
        
        let isSelected = filterData[indexPath.row]
        
        if currentSelectedIndex == MenuCategory.building.rawValue {
            cell?.accessoryType = isSelected ? .none : .checkmark
            filterData[indexPath.row] = !isSelected
        } else {
            
            for (index, _) in filterData.enumerated() {
                filterData[index] = index == indexPath.row ? !isSelected : false
            }
            
            tableView.reloadData()
        }
        
        if currentSelectedIndex == MenuCategory.building.rawValue {
            ClassroomsManager.sharedInstance.buildingsFilter = filterData
        } else {
            ClassroomsManager.sharedInstance.distanceFilter = filterData
        }
    }
    
}
