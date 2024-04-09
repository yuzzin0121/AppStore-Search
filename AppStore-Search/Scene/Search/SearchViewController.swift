//
//  SearchViewController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {
    let mainView = SearchView()
    
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    private func bind() {
        let input = SearchViewModel.Input(searchButtonTap: mainView.searchController.searchBar.rx.searchButtonClicked,
                                          searchText: mainView.searchController.searchBar.rx.text.orEmpty)
        
        let output = viewModel.transform(input: input)
        
        output.appList
            .bind(to: mainView.tableView.rx.items(cellIdentifier: AppTableViewCell.identifier, cellType: AppTableViewCell.self)) { (row, element, cell) in
                cell.configureCell(item: element)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        output.error
            .asDriver(onErrorJustReturn: "")
            .drive(with: self) { owner, value in
                owner.showAlert(title: "에러", message: value)
            }
            .disposed(by: disposeBag)
        
        Observable.zip(mainView.tableView.rx.itemSelected, mainView.tableView.rx.modelSelected(App.self))
            .map { $0.1 }
            .subscribe(with: self) { owner, app in
                let appDetailVC = AppDetailViewController()
                appDetailVC.viewModel.app = app
                owner.navigationController?.pushViewController(appDetailVC, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    
    override func loadView() {
        view = mainView
    }
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
        navigationItem.title = "검색"
        navigationItem.searchController = mainView.searchController
    }

}
