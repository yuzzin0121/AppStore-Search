//
//  AppStoreAPI.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import Foundation
import RxSwift
import RxCocoa

enum APIError: String, Error {
    case invalidURL = "유효하지 않은 url입니다."
    case unknownReponse = "알수없는 응답 실패가 발생했습니다."
    case statusError = "서버 요청에 실패하였습니다."
}

class AppStoreAPIManager {
    static let shared = AppStoreAPIManager()
    let urlString = "https://itunes.apple.com/search?term=일기&country=kr&entity=software"
    
    func fetchAppData(query: String) -> Single<AppSearchModel> {
        return Single.create { single in
            guard let url = URL(string: "https://itunes.apple.com/searchdd?term=\(query)&country=kr&entity=software") else {
                single(.failure(APIError.unknownReponse))
                
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    single(.failure(APIError.unknownReponse))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    single(.failure(APIError.statusError))
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(AppSearchModel.self, from: data) {
                    single(.success(appData))
                } else {
                    single(.failure(APIError.unknownReponse))
                }
            }.resume()
            
            return Disposables.create()
        }.debug()
    }
}
