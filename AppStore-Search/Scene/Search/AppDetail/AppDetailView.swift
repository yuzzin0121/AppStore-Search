//
//  AppDetailView.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import UIKit

final class AppDetailView: BaseView {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let downLoadButton = DownLoadButton()
    private let screenshotScrollView = UIScrollView()
    let screenshotStackView = UIStackView()
    let updateLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        [iconImageView, titleLabel, updateLabel, downLoadButton, screenshotScrollView, descriptionLabel].forEach {
            contentView.addSubview($0)
        }
        screenshotScrollView.addSubview(screenshotStackView)
    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top).offset(8)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-20)
        }

        downLoadButton.snp.makeConstraints { make in
            make.bottom.equalTo(iconImageView.snp.bottom)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.width.equalTo(64)
            make.height.equalTo(32)
        }
        
        screenshotScrollView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(250)
        }
        
        screenshotStackView.snp.makeConstraints { make in
            make.height.equalTo(screenshotScrollView)
            make.edges.equalTo(screenshotScrollView)
        }
        
        updateLabel.snp.makeConstraints { make in
            make.top.equalTo(screenshotScrollView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(updateLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    override func configureView() {
        iconImageView.layer.cornerRadius = 18
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderWidth = 1
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        screenshotScrollView.showsHorizontalScrollIndicator = false
        
        screenshotStackView.distribution = .fillEqually
        screenshotStackView.alignment = .fill
        screenshotStackView.spacing = 12
    }
}
