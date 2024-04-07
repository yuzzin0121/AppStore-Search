//
//  TabItem.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit

enum TabItem: CaseIterable {
    case today
    case game
    case app
    case arcade
    case search
    
    var title: String {
        switch self {
        case .today: return "투데이"
        case .game: return "게임"
        case .app: return "앱"
        case .arcade: return "Arcade"
        case .search: return "검색"
        }
    }
    
    var image: UIImage {
        switch self {
        case .today: return ImageStyle.today
        case .game: return ImageStyle.game
        case .app: return ImageStyle.square
        case .arcade: return ImageStyle.arcade
        case .search: return ImageStyle.search
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .today: return ImageStyle.todayFill
        case .game: return ImageStyle.gameFill
        case .app: return ImageStyle.squareFill
        case .arcade: return ImageStyle.arcadeFill
        case .search: return ImageStyle.searchFill
        }
    }
}
