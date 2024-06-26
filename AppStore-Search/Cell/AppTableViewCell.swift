//
//  AppTableViewCell.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit
import Kingfisher

class AppTableViewCell: UITableViewCell {
    static let identifier = "AppTableViewCell"
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let downLoadButton = DownLoadButton()
    private lazy var thumbnailStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureCell(item: nil)
        thumbnailStackView = UIStackView()
    }
    
    func configureCell(item: App?) {
        guard let item else { return }
        iconImageView.kf.setImage(with: URL(string: item.artworkUrl60))
        titleLabel.text = item.trackName
        
        for url in item.screenshotUrls.prefix(3) {
            guard let url = URL(string: url) else { return }
            let imageView = ScreenshotImageView(frame: .zero)
            
            imageView.kf.setImage(with: url)
            thumbnailStackView.addArrangedSubview(imageView)
        }
    }
}

extension AppTableViewCell: ViewProtocol {
    
    func configureHierarchy() {
        [iconImageView, titleLabel, downLoadButton, thumbnailStackView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.size.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.trailing.equalTo(downLoadButton.snp.leading).offset(-12)
        }
        
        downLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(64)
            make.height.equalTo(32)
        }
        
        thumbnailStackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-20)
            make.height.equalTo(200)
        }
    }
    
    func configureView() {
        iconImageView.layer.cornerRadius = 12
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderWidth = 1
        iconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        
        thumbnailStackView.axis = .horizontal
        thumbnailStackView.distribution = .fillEqually
        thumbnailStackView.alignment = .fill
        thumbnailStackView.spacing = 12
    }
}
