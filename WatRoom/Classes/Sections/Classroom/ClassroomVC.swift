//
//  ClassroomVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 7/12/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol ClassroomVCDelegate: class {
    func didTapBack()
}

class ClassroomVC: UIViewController, StoryboardInstantiable {
    
    static var identifier = "ClassroomVC"
    
    @IBOutlet fileprivate weak var classRoomImage: UIImageView! {
        didSet {
            setupImageView()
        }
    }
    
    @IBOutlet fileprivate weak var roomtitle: UILabel!
    
    @IBOutlet fileprivate weak var shareButton: UIButton!
    @IBOutlet fileprivate weak var reportErrorButton: UIButton!
    
    weak var delegate: ClassroomVCDelegate?
    
<<<<<<< HEAD
    @IBAction func tappedReport(_ sender: Any) {
        let alert = UWScheduleAlert(style: UWScheduleAlertStyle.notifyEnableNotification)
        alert.delegate = self
        alert.show()
    }
    
    var data: (classroom: Classroom, building: Building)? {
=======
    var data: (classroom: Classroom, building: Building, time: String)? {
>>>>>>> cc76db66d111a4dac1918e6f40a1f69a1684914a
        didSet {
            reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        
        guard parent == nil else { return }
        delegate?.didTapBack()
    }
    
    private func reloadData() {
        guard let classroom = data?.classroom, let building = data?.building else { return }
        
        setupUI()
        
        roomtitle?.text = building.abbreviation + " - " + classroom.roomNumber
    }
    
    @IBAction func didTapShare(_ sender: Any) {
        guard let classroom = data?.classroom, let building = data?.building, let time = data?.time else { return }
        
        let sampleMessage = "Meet at \(building.abbreviation)-\(classroom.roomNumber) between \(time)"
        
        let activityViewController = UIActivityViewController(activityItems: [sampleMessage], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension ClassroomVC {
    
    func setupUI() {
        setupNavBar()
    }
    
    func setupNavBar() {
        guard let classroom = data?.classroom, let building = data?.building else { return }
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleView.text = building.abbreviation + " " + classroom.roomNumber
        titleView.textColor = UIColor.darkGray
        titleView.font = UIFont.init(name: "Avenir-Medium", size: 18)
        navigationItem.titleView = titleView
    }
    
    func setupImageView() {
        classRoomImage.layer.cornerRadius = 5
        classRoomImage.layer.masksToBounds = true
    }
}

extension ClassroomVC: UWScheduleAlertDelegate {
    
    func userEnableNotification() {
        
    }
}
