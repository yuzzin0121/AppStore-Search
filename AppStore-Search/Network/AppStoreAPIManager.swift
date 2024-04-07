//
//  AppStoreAPI.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import Foundation
import RxSwift
import RxCocoa

enum APIError: Error {
    case invalidURL
    case unknownReponse
    case statusError
}

class AppStoreAPIManager {
    static let shared = AppStoreAPIManager()
    let urlString = "https://itunes.apple.com/search?term=일기&country=kr&entity=software"
    
    func fetchAppData(query: String) -> Observable<AppSearchModel> {
        return Observable<AppSearchModel>.create { observer in
            guard let url = URL(string: "https://itunes.apple.com/search?term=\(query)&country=kr&entity=software") else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    observer.onError(APIError.unknownReponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(AppSearchModel.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.unknownReponse)
                }
            }.resume()
            
            return Disposables.create()
        }.debug()
    }
}
