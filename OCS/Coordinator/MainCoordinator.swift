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
}
