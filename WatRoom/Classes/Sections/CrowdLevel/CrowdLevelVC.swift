//
//  CrowdLevelVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/13/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit
import UICircularProgressRing

protocol CrowdLevelVCDelegate: class {
    func didTapBack()
}

class CrowdLevelVC: UIViewController, StoryboardInstantiable {
    
    static var identifier = "CrowdLevelVC"
    
    weak var delegate: CrowdLevelVCDelegate?
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    @IBOutlet weak var progressRing: UICircularProgressRingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progressRing.setProgress(value: 68, animationDuration: 2.0) {
            print("Done animating!")
            // Do anything your heart desires...
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        
        guard parent == nil else { return }
        delegate?.didTapBack()
    }
    
}

extension CrowdLevelVC {
    
    func setupUI() {
        setupNavBar()
        setupTableView()
        
        progressRing.font = UIFont.init(name: "Avenir-Medium", size: 18)!
    }
    
    func setupNavBar() {
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleView.text = "Library Crowd Level"
        titleView.textColor = UIColor.darkGray
        titleView.font = UIFont.init(name: "Avenir-Medium", size: 18)
        navigationItem.titleView = titleView
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
}

extension CrowdLevelVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CrowdLevelCell.identifier, for: indexPath)
            as? CrowdLevelCell else {
                return UITableViewCell()
        }
        
//        let building = buildings[indexPath.section]
//        cell.classroom = building.classrooms[indexPath.row]
//
//        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension CrowdLevelVC: UITableViewDelegate {
    
}
