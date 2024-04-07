//
//  DownLoadButton.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import UIKit

final class DownLoadButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        setTitle("받기", for: .normal)
        setTitleColor(.tintColor, for: .normal)
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
