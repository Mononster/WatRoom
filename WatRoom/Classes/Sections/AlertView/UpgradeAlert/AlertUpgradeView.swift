//
//  AlertUpgradeView.swift
//  RateMyProfSpider
//
//  Created by Monster on 2017-07-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol AlertUpgradeViewDelegate: class {
    func upgradeBtnClicked()
}

class AlertUpgradeView: UIView {
    
    var tableView: UITableView!
    
    var updateData = ["1. Improved mathcing algrithms.",
                      "2. Minor bug fixed <3",
                      "3. System notification updates."]
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var upgradeButton: UIButton! {
        didSet {
            upgradeButton.layer.cornerRadius = 4
        }
    }
    @IBAction func upgradeBtnClicked(_ sender: Any) {
        delegate?.upgradeBtnClicked()
    }
    
    weak var delegate: AlertUpgradeViewDelegate?
    
    class func upgradeAlertView() -> AlertUpgradeView {
        
        let nib = UINib(nibName: "AlertUpgradeView", bundle: nil)
        
        return nib.instantiate(withOwner: nil, options: nil)[0] as! AlertUpgradeView
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    func startAnimation(){
        self.isHidden = false
        titleImage.startAnimating()
    }
    
    func stopAnimation(){
        titleImage.stopAnimating()
        self.isHidden = true
    }
}

extension AlertUpgradeView {
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        titleImage.backgroundColor = UIColor.clear
        titleImage.image = UIImage.gif(name: "goose")
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        registerNib()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.white
        
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        tableView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.upgradeButton.topAnchor, constant: -10).isActive = true
    }
    
    func registerNib(){
        tableView?.register(UINib.init(nibName: "AlertUpgradeCell", bundle: nil), forCellReuseIdentifier: "AlertUpgradeCell")
    }
}

extension AlertUpgradeView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updateData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertUpgradeCell", for: indexPath) as! AlertUpgradeCell
        cell.content = updateData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension AlertUpgradeView: UITableViewDelegate {
    
}

