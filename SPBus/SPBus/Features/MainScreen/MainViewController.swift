//
//  MainViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

/// The controller the app starts with
final class MainViewController: UIViewController {

    let mainView: MainView

    init(mainView: MainView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: Bundle.main)
        self.mainView.mainViewModel.vc = self
        title = K.MainScreen.title
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
