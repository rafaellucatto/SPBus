//
//  StopByNameOrAddressViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class StopByNameOrAddressViewController: UIViewController {

    let stopByNameOrAddressView: StopByNameOrAddressView
    let viewModel: StopByNameOrAddressViewModelProtocol
    let searchController: UISearchController

    init(viewModel: StopByNameOrAddressViewModelProtocol) {
        self.viewModel = viewModel
        stopByNameOrAddressView = .init(viewModel: viewModel)
        searchController = SearchController()
        super.init(nibName: nil, bundle: Bundle.main)
        title = "Paradas por linha"
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Digite a linha"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = stopByNameOrAddressView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
