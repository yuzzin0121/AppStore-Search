//
//  BaseViewController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
    }
    
    func configureNavigationItem() { 
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

