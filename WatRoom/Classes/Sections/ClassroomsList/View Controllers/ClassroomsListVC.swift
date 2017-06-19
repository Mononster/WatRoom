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
}

class ClassroomsListVC: UIViewController, StoryboardInstantiable {
    
    static let identifier = "ClassroomsListVC"
    
    weak var delegate: ClassroomsListVCDelegate?
    
    fileprivate var searchBar: UISearchBar?
    fileprivate var searchBarButtonItem: UIBarButtonItem?
    fileprivate var titleView: UILabel?
    fileprivate var sortDropDownTable: SortDropDownTable?
    
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
        //addCrowdLevelButtons()
        
        configureMapView()
        
        buildings = ClassroomsManager.sharedInstance.buildings
        reloadData()
    }
    
    private func addCrowdLevelButtons() {
        
        // TODO: this is temporary. will need to be replaced by icons
        let crowdLevelButton = UIBarButtonItem(title: "Crowd", style: .plain, target: self, action: #selector(didTapCrowdLevel))
        navigationItem.rightBarButtonItem = crowdLevelButton
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
    
    
    fileprivate func configureMapView() {
        requestLocationAccess()
    }
    
    fileprivate func loadMapData() {
        var annotations: [BuildingAnnotation] = []
        
        for building in buildings {
            let annotation = BuildingAnnotation(title: building.name,
                                                subtitle: "Classrooms available: " + String(building.classrooms.count),
                                                coordinate: building.locationCoordinate)
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
        titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleView?.text = "Classrooms"
        titleView?.textColor = UIColor.gray
        titleView?.font = UIFont.systemFont(ofSize: 21)
        navigationItem.titleView = titleView
        setupDropDownMenu()
        setupSearchBar()
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
            guard ClassroomsManager.sharedInstance.buildingsFilter[index] != false else { continue }
            filteredBuildings.append(building)
        }
        
        buildings = filteredBuildings
    }
    func updateListMapViewState(_ isListView: Bool, completion: @escaping () -> ()) {
        
        sortDropDownTable?.hideViewWithoutAnimation()
        sortDropDownTable?.removeFromSuperview()
        if isListView {
            // transition from mapview to tableview
            self.view.addSubview(sortDropDownTable!)
            UIView.transition(from: self.mapView!, to: self.tableView!, duration: 0.8, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: { _ in
                completion()
            })
            
        } else {
            // transition from tableView to mapView.
            self.view.addSubview(sortDropDownTable!)
            UIView.transition(from: self.tableView!, to: self.mapView!, duration: 0.8, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: { _ in
                completion()
            })
            
        }
        
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
            }, completion: nil)
    }
}

extension ClassroomsListVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
}

extension ClassroomsListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ClassroomsListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return buildings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings[section].classrooms.count
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
        
        return cell
    }
}


