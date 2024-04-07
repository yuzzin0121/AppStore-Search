//
//  SearchViewController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit

class SearchViewController: BaseViewController {
    let mainView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
        navigationItem.title = "검색"
    }

}
