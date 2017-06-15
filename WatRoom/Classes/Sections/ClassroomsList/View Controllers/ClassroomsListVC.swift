//
//  ClassroomsListVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

protocol ClassroomsListVCDelegate: class {
    
}

class ClassroomsListVC: UIViewController, StoryboardInstantiable {
    
    static let identifier = "ClassroomsListVC"
    
    weak var delegate: ClassroomsListVCDelegate?
    var searchBar: UISearchBar!
    var searchBarButtonItem: UIBarButtonItem!
    var titleView: UILabel!
    
    override func viewDidLoad() {
        setupUI()
    }
}

extension ClassroomsListVC {
    
    func setupUI() {
        titleView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        titleView.text = "Classrooms"
        titleView.textColor = UIColor.gray
        titleView.font = UIFont.systemFont(ofSize: 21)
        navigationItem.titleView = titleView
        setupDropDownMenu()
        setupSearchBar()
    }
    
    func setupDropDownMenu() {
        let frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: 40)
        let sortDropDownTable = SortDropDownTable(frame: frame)
        // delegate that controls the drop down menu on home view controller.
        self.view.addSubview(sortDropDownTable)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = .minimal
        searchBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "searchbar_indicator"), style: .plain, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem = searchBarButtonItem
    }
}

extension ClassroomsListVC {
    
    func showSearchBar() {
        searchBar.alpha = 0
        navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(nil, animated: true)
        navigationItem.setRightBarButton(nil, animated: true)
        self.searchBar.becomeFirstResponder()
        UIView.animate(withDuration: 0.3, animations: {
            self.searchBar.alpha = 1
        }, completion: { finished in
            
        })
    }
    
    func hideSearchBar() {
        navigationItem.setRightBarButton(searchBarButtonItem, animated: true)
        self.titleView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationItem.titleView = self.titleView
            self.titleView.alpha = 1
        }, completion: { finished in
            
        })
    }
}

extension ClassroomsListVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
}

