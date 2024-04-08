//
//  AppDetailViewController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/8/24.
//

import UIKit

final class AppDetailViewController: BaseViewController {
    let mainView = AppDetailView()
    
    let viewModel = AppDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    private func setData() {
        guard let appData = viewModel.app else { return }
        mainView.iconImageView.kf.setImage(with: URL(string: appData.artworkUrl60))
        mainView.titleLabel.text = appData.trackName
        mainView.updateLabel.text = appData.releaseNotes
        mainView.descriptionLabel.text = appData.description
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let appData = viewModel.app else { return }
        
        
        for url in appData.screenshotUrls {
            guard let url = URL(string: url) else { return }
            let imageView = ScreenshotImageView(frame: .zero)
            imageView.kf.setImage(with: url)
            mainView.screenshotStackView.addArrangedSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.width.equalTo(view.snp.width).dividedBy(3)
            }
        }
        print("width: \(view.frame.width)")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func configureNavigationItem() {
        navigationItem.largeTitleDisplayMode = .never
    }
}
