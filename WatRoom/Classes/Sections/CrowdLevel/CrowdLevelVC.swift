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
    
    fileprivate let crowdLevelData = MockData.generateCrowdLevelData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let sum = crowdLevelData.reduce(0) { (result, data) in
            return result + data.level
        }
        
        progressRing.setProgress(value: CGFloat(sum/crowdLevelData.count), animationDuration: 2.0) {
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
        titleView.text = "Campus Crowd Level"
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
        return crowdLevelData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CrowdLevelCell.identifier, for: indexPath)
            as? CrowdLevelCell else {
                return UITableViewCell()
        }
        
        cell.crowdData = crowdLevelData[indexPath.row]
        
        return cell
    }
}

extension CrowdLevelVC: UITableViewDelegate {
    
}
