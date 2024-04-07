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
        
        for url in appData.screenshotUrls.prefix(3) {
            guard let url = URL(string: url) else { return }
            let imageView = ScreenshotImageView(frame: .zero)
            imageView.kf.setImage(with: url)
            mainView.previewStackView.addArrangedSubview(imageView)
        }
        
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func configureNavigationItem() {
        navigationItem.largeTitleDisplayMode = .never
    }
}
