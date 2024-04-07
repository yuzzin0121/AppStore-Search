//
//  AppDetailViewController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import UIKit

class AppDetailViewController: BaseViewController {
    let mainView = AppDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func configureNavigationItem() {
        
    }
}
