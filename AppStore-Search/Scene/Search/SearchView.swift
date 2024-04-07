//
//  SearchView.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit
import SnapKit

final class SearchView: BaseView {
    let searchController = UISearchController()
    let tableView = UITableView()
    
    override func configureHierarchy() {
        addSubview(tableView)
    }
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    override func configureView() {
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        tableView.backgroundColor = .systemGray6
        tableView.register(AppTableViewCell.self, forCellReuseIdentifier: AppTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}
