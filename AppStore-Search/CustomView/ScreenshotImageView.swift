//
//  ScreenshotImageView.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import UIKit

class ScreenshotImageView: UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        contentMode = .scaleAspectFill
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
