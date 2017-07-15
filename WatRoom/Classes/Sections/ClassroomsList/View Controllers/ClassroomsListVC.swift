//
//  ClassroomsListVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol ClassroomsListVCDelegate: class {
    func didTapCrowdLevel()
    func didTapClassroom(_ classroom: Classroom, inBuilding building: Building)
}

class ClassroomsListVC: UIViewController, StoryboardInstantiable {
    
    static let identifier = "ClassroomsListVC"
    
    weak var delegate: ClassroomsListVCDelegate?
    
    fileprivate var searchBar: UISearchBar?
    fileprivate var searchBarButtonItem: UIBarButtonItem?
    fileprivate var crowdLevelButton: UIBarButtonItem?
    fileprivate var titleView: UILabel?
    fileprivate var sortDropDownTable: SortDropDownTable?
    fileprivate var dataLodingView: DataLoadingView?
    
    @IBOutlet weak var mapView: MKMapView?
    fileprivate let locationManager = CLLocationManager()
    
    @IBOutlet weak var tableView: UITableView?
    
    fileprivate var buildings: [Building] = [] {
        didSet {
            reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureMapView()
        
        self.tableView?.separatorStyle = .none
        self.dataLodingView?.isHidden = false
        ClassroomsManager.sharedInstance.fetchData { [weak self] (buildings: [Building]) in
            self?.buildings = buildings
            self?.reloadData()
            self?.sortDropDownTable?.reloadData()
            self?.dataLodingView?.isHidden = true
            self?.tableView?.separatorStyle = .singleLine
        }
        
        didUpdateFilters()
    }
    
    func didTapCrowdLevel(sender: UIBarButtonItem) {
        delegate?.didTapCrowdLevel()
    }
    
    fileprivate func reloadData() {
        tableView?.reloadData()
        loadMapData()
        
        guard let map = mapView else { return }
        map.showAnnotations(map.annotations, animated: true)
    }
}

extension ClassroomsListVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
        buildings = ClassroomsManager.sharedInstance.buildings
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.characters.count > 0 else {
            buildings = ClassroomsManager.sharedInstance.buildings
            return
        }
    
        buildings = ClassroomsManager.sharedInstance.buildings.filter { $0.name.hasPrefix(searchText) }
    }
}

extension ClassroomsListVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAnnotationView(sender:)))
        view.addGestureRecognizer(tap)
    }
    
    func didTapAnnotationView(sender: UITapGestureRecognizer) {
        guard
            let annotationView = sender.view as? MKAnnotationView,
            let annotation = annotationView.annotation as? BuildingAnnotation else { return }
        
        let annotationBuilding = annotation.building
        
        for (index, building) in ClassroomsManager.sharedInstance.buildings.enumerated() {
            guard building.abbreviation != annotationBuilding.abbreviation else {
                ClassroomsManager.sharedInstance.buildingsFilter[index] = true
                continue
            }
            
            ClassroomsManager.sharedInstance.buildingsFilter[index] = false
        }
        
        didUpdateFilters()
        
        updateListMapViewState(true) { [weak self] in
            self?.sortDropDownTable?.mapButton?.isEnabled = true
        }
    }
}

extension ClassroomsListVC {
    
    fileprivate func configureMapView() {
        mapView?.delegate = self
        requestLocationAccess()
    }
    
    fileprivate func loadMapData() {
        var annotations: [BuildingAnnotation] = []
        
        for building in buildings {
            let annotation = BuildingAnnotation(building)
            annotations.append(annotation)
        }
        
        mapView?.removeAllAnnotations()
        mapView?.addAnnotations(annotations)
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            mapView?.showsUserLocation = true
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}



extension ClassroomsListVC {
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        setupNavBar()
        setupDropDownMenu()
        setupSearchBar()
        setupDataLoadingView()
    }
    
    func setupDataLoadingView(){
        self.dataLodingView = DataLoadingView.dataLoadingView()
        self.view.addSubview(dataLodingView!)
        
        self.dataLodingView?.translatesAutoresizingMaskIntoConstraints = false
        
        dataLodingView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dataLodingView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
    }
    
    func setupNavBar() {
        titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleView?.text = "Classrooms"
        titleView?.textColor = UIColor.darkGray
        titleView?.font = UIFont.init(name: "Avenir-Medium", size: 21)
        navigationItem.titleView = titleView
        
        // TODO: this is temporary. will need to be replaced by icons
        crowdLevelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_library"), style: .plain, target: self, action: #selector(didTapCrowdLevel))
        navigationItem.leftBarButtonItem = crowdLevelButton
    }
    
    func setupDropDownMenu() {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40)
        sortDropDownTable = SortDropDownTable(frame: frame)
        sortDropDownTable?.menuDelegate = self
        
        // delegate that controls the drop down menu on home view controller.
        view.addSubview(sortDropDownTable!)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar?.delegate = self
        searchBar?.showsCancelButton = true
        searchBar?.searchBarStyle = .minimal
        searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_search"), style: .plain, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem = searchBarButtonItem
    }
}

extension ClassroomsListVC: MenuDelegate {
    
    func didUpdateFilters() {
        var filteredBuildings: [Building] = []

        for (index, building) in ClassroomsManager.sharedInstance.buildings.enumerated() {
            guard ClassroomsManager.sharedInstance.buildingsFilter.count > 0,
                ClassroomsManager.sharedInstance.buildingsFilter[index] != false else { continue }
            
            let filteredBuilding = Building(name: building.name, abbreviation: building.abbreviation,
                                            location: building.locationCoordinate,
                                            classrooms: timeFilterClassrooms(forBuilding: building))
            
            guard filteredBuilding.classrooms.count > 0 else { continue }
            filteredBuildings.append(filteredBuilding)
        }
        
        buildings = filteredBuildings
    }
    
    func updateListMapViewState(_ isListView: Bool, completion: @escaping () -> ()) {
        
        sortDropDownTable?.hideViewWithoutAnimation()
        sortDropDownTable?.removeFromSuperview()
        if isListView {
            // transition from mapview to tableview
            self.view.addSubview(sortDropDownTable!)
            UIView.transition(from: self.mapView!, to: self.tableView!, duration: 0.8, options: [.transitionFlipFromRight, .showHideTransitionViews, .curveEaseInOut], completion: { _ in
                completion()
            })
            
        } else {
            // transition from tableView to mapView.
            self.view.addSubview(sortDropDownTable!)
            UIView.transition(from: self.tableView!, to: self.mapView!, duration: 0.8, options: [.transitionFlipFromLeft, .showHideTransitionViews, .curveEaseInOut], completion: { _ in
                completion()
            })
            
        }
    }
    
    func timeFilterClassrooms(forBuilding building: Building) -> [Classroom] {
        guard ClassroomsManager.sharedInstance.dayFilter != Day(name: .saturday)
            && ClassroomsManager.sharedInstance.dayFilter != Day(name: .sunday) else { return [] }
        
        let tenMinutes = 60 * 10
        
        let minIndex = 7 * 60 * 60 / tenMinutes
        let maxIndex = 22 * 60 * 60 / tenMinutes
        
        let day = ClassroomsManager.sharedInstance.dayFilter
        
        let startIndex = Int(ClassroomsManager.sharedInstance.timeFilter.start.timeIntervalSinceReferenceDate) / tenMinutes
        let endIndex = Int(ClassroomsManager.sharedInstance.timeFilter.end.timeIntervalSinceReferenceDate) / tenMinutes
        
        guard startIndex >= minIndex && endIndex <= maxIndex else { return [] }
        
        var filteredClassrooms: [Classroom] = []
        
        for classroom in building.classrooms {
            guard let availability = classroom.availability[day], availability.count == 90 else { continue }
            
            let rangeStart = startIndex - minIndex
            let rangeEnd = endIndex - minIndex - 1
            
            guard rangeStart >= 0 && rangeEnd < availability.count && rangeStart < rangeEnd else { continue }
            let filteredAvailability = Array(availability[rangeStart...rangeEnd])
            
            guard filteredAvailability.count > 0 else { continue }
            
            let shouldShowClassroom = filteredAvailability.reduce(0, { (result, available) in
                return available ? result + 1 : result
            }) > 1
            
            if shouldShowClassroom {
                filteredClassrooms.append(classroom)
            }
        }
        
        return filteredClassrooms
    }
}

extension ClassroomsListVC {
    
    func showSearchBar() {
        searchBar?.alpha = 0
        navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(nil, animated: true)
        navigationItem.setRightBarButton(nil, animated: true)
        searchBar?.becomeFirstResponder()
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.searchBar?.alpha = 1
            }, completion: nil)
    }
    
    func hideSearchBar() {
        navigationItem.setRightBarButton(searchBarButtonItem, animated: true)
        titleView?.alpha = 0
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.navigationItem.titleView = self?.titleView
            self?.titleView?.alpha = 1
            } ,completion:
            { _ in
                self.navigationItem.leftBarButtonItem = self.crowdLevelButton
        })
    }
}

extension ClassroomsListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let building = buildings[indexPath.section]
        let classroom = building.classrooms[indexPath.row]
        
        delegate?.didTapClassroom(classroom, inBuilding: building)
    }
    
    
}

extension ClassroomsListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return buildings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings[section].classrooms.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Palette.themeColor
        header.textLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return buildings[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClassroomsListCell.identifier, for: indexPath)
            as? ClassroomsListCell else {
                return UITableViewCell()
        }
        
        let building = buildings[indexPath.section]
        cell.classroom = building.classrooms[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
