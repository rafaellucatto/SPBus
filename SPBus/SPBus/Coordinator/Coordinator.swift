//
//  Coordinator.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

/// A class to handle screen transition
final class Coordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    var window: UIWindow

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    /// Starts the app by initializing the first controller with other necessary classes
    func start() {
        var viewModel: MainViewModelProtocol = MainViewModel()
        viewModel.coordinator = self
        let mainView: MainView = .init(mainViewModel: viewModel)
        let mainViewController: MainViewController = .init(mainView: mainView)
        navigationController.pushViewController(mainViewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
