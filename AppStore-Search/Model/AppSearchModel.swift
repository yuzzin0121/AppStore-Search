//
//  AppSearchModel.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import Foundation

struct AppSearchModel: Decodable {
    let resultCount: Int
    let results: [App]
}

struct App: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewUrl: String
    let trackId: Int
    let trackName: String
    let description: String
    let releaseNotes: String
    let genres: [String]
    let artistName: String
    let contentAdvisoryRating: String
    let version: String
}

