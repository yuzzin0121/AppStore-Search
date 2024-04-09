//
//  SearchViewModel.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    let disposeBag = DisposeBag()
    
    // 검색어, 서치버튼 클릭
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
        
    }
    
    // 검색 결과
    struct Output {
        let appList: PublishSubject<[App]>
        let error: PublishRelay<String>
    }
    
    deinit {
        print("Deinit" + String(describing: self))
    }
    
    func transform(input: Input) -> Output {
        let appList = PublishSubject<[App]>()
        let errorString: PublishRelay<String>
        
        input.searchButtonTap
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .map { $0.trimmingCharacters(in: [" "]) }
            .flatMap {
                AppStoreAPIManager.shared.fetchAppData(query: $0)
                .catch { error in
                    errorString.accept(error.localizedDescription)
                    return Single<AppSearchModel>.never()
                }
            }
            .debug()
            .subscribe(with: self) { owner, appSearchModel in
                let data = appSearchModel.results
                appList.onNext(data)
            } onError: { _, _ in
                print("Fetch Error")
            } onCompleted: { _ in
                print("Fetch Completed")
            } onDisposed: { _ in
                print("Fetch Disposed")
            }
            .disposed(by: disposeBag)

        
        return Output(appList: appList, error: errorString)
    }
}
