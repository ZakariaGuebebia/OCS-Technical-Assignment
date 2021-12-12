//
//  MainCoordinator.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit
import AVKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SearchViewController.instantiate(appStoryboard: .main) as! SearchViewController
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func showAlertWith(message: String, title: String?, validateTitle: String, completion: @escaping (() -> Void?) = ({}) ) {
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: .alert)
        let validatAction = UIAlertAction(title: validateTitle, style: .default) { _ in
            completion()
        }
        alertController.addAction(validatAction)
        navigationController.present(alertController, animated: true)
    }

    func showDetails(serie: Serie) {
        let vc = DetailsViewController.instantiate(appStoryboard: .details) as! DetailsViewController
        let viewModel = OCSDetailsViewModel(serie: serie)
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func presentVideoPlayer() {
        let viewModel = SerieViewModel(url: "https://bitmovin-a.akamaihd.net/content/bbb/stream.m3u8")
        guard let videoURL = URL(string: viewModel.url) else {return}
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        navigationController.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}
