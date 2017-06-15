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
    var mapListViewButton: NavigationButton!
    
    // true indicates displaying list view
    // false indicates displaying map view.
    var isListViewStage = true
    
    var titleData = ["Building", "Distance", "Time"]
    var dataCategory = [[("Sort by date", "Sort by date"),
                         ("Sort by price from high to low", "Price high to low"),
                         ("Sort by price from low to high", "Price low to high")],
                        [("Within 1km from school" , "Within 1km"),
                         ("Within 2km from school" , "Within 2km"),
                         ("Within 3km from school" , "Within 3km"),
                         ("Within 5km from school" , "Within 5km")]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.menuBarHeight = frame.height
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SortDropDownTable{
    
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
        let separatorWidth: CGFloat = 1
        // save mapListButtonWidth
        let categoryTotalWidth: CGFloat = self.frame.width - mapListButtonWidth - btnToScreenMargin
        var categoryWidth: CGFloat = categoryTotalWidth / count - count * separatorWidth
        
        if count == 0 {
            categoryWidth = 0
        }
        
        let categoryHeight: CGFloat = self.menuBarHeight
        for i in 0..<numOfCategory {
            let categoryButton = NavigationButton.navigationButton(title: titleData[i], imageName: "triangle_down")
            categoryButton.tag = i
            categoryButton.frame = CGRect(x: CGFloat(i) * categoryWidth, y: 0, width : categoryWidth, height : categoryHeight)
            categoryButton.arrowHeight.constant = 8
            categoryButton.arrowWidth.constant = 8
            
            categoryButton.title.font = UIFont.systemFont(ofSize: 15)
            categoryButton.title.textColor = .gray
            
            categoryButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
            
            menuBarContainer.addSubview(categoryButton)
            
            categoryButtons.append(categoryButton)
        }
        
        // setup map list view
        
        mapListViewButton = NavigationButton.navigationButton(title: "Map", imageName: "mapView_indicator")
        mapListViewButton.frame = CGRect(x: CGFloat(numOfCategory) * categoryWidth, y: 0, width: mapListButtonWidth, height: categoryHeight )
        mapListViewButton.title.font = UIFont.systemFont(ofSize: 15)
        mapListViewButton.title.textColor = .gray
        mapListViewButton.arrowHeight.constant = 20
        mapListViewButton.arrowWidth.constant = 18
        mapListViewButton.separator.isHidden = true
        
        mapListViewButton.addTarget(self, action: #selector(mapListViewButtonTapped(_ :)), for: .touchUpInside)
        
        menuBarContainer.addSubview(mapListViewButton!)
        
        self.addSubview(menuBarContainer!)
    }
    
    func setupTableView() {
        
        // when we do not present the tableview, we set the height to be 0.
        // the reason we add self.farme.minY is because we want to add tableview
        // at top of our keyWindow.
        
        // 64 for navigation bar
        self.tableView = UITableView(frame: CGRect(x: 0, y: menuBarContainer.frame.height + 64, width : self.frame.width, height : 0))
        
        tableViewOriginFrame = tableView.frame
        tableView.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 38
        tableView.autoresizesSubviews = false
        tableView.register(UINib.init(nibName: "DropDownMenuCell", bundle: nil), forCellReuseIdentifier: "DropDownMenuCell")
        tableView.register(UINib.init(nibName: "DropDownMenuTimeCell", bundle: nil), forCellReuseIdentifier: "DropDownMenuTimeCell")
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
    
    @objc func mapListViewButtonTapped(_ sender: NavigationButton) {
        isListViewStage = !isListViewStage
        
        self.mapListViewButton.isEnabled = false
        if isListViewStage{
            sender.title.text = "Map"
            sender.arrow.image = #imageLiteral(resourceName: "mapView_indicator")
//            self.sortTableDelegate?.updateListMapViewState(true){
//                self.mapListViewButton?.isEnabled = true
//            }
        }else{
            sender.title.text = "List"
            sender.arrow.image = #imageLiteral(resourceName: "listView_indicator")
//            self.sortTableDelegate?.updateListMapViewState(false){
//                self.mapListViewButton?.isEnabled = true
//            }
        }
    }
    
    @objc func menuButtonTapped(_ sender: NavigationButton) {
        let prevSelectedIndex = currentSelectedIndex
        currentSelectedIndex = sender.tag
        tableView.reloadData()
        var tableViewHeight = CGFloat(tableView.numberOfRows(inSection: 0)) * tableView.rowHeight + 20
        
        if currentSelectedIndex == 2 {
            tableView.isScrollEnabled = false
            tableViewHeight = 320
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
        
        return dataCategory[currentSelectedIndex].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if currentSelectedIndex == 2 {
            return 300
        }
        
        if dataCategory[currentSelectedIndex].count > 4{
            return 41
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if currentSelectedIndex == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownMenuTimeCell", for: indexPath) as! DropDownMenuTimeCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownMenuCell", for: indexPath) as! DropDownMenuCell
        
        let infoDict = dataCategory[currentSelectedIndex]
        
        cell.title.text = infoDict[indexPath.row].0
        cell.displayText = infoDict[indexPath.row].1
        
        if indexPath.row == 0{
            cell.separator.isHidden = true
        }
        
        let button = categoryButtons[currentSelectedIndex]
        
        cell.accessoryType = button.title.text == cell.displayText ? .checkmark : .none
        
        return cell
        
    }
    
}

extension SortDropDownTable: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if currentSelectedIndex == 2 {
            return
        }
        
        let cell = tableView.cellForRow(at: indexPath) as? DropDownMenuCell
        
        let button = categoryButtons[currentSelectedIndex]
        
        button.title.text = cell?.displayText
        
        present = !present
        
        cleanUI()
        
//        if let delegate = self.sortTableDelegate  {
//            let row = indexPath.row
//            delegate.updateInfoBySectionAndRow(section: currentSelectedIndex, row: row)
//        }
        
    }
    
}

