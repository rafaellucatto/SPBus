//
//  StopByLineViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class StopByLineViewController: UIViewController {

    let viewModel: StopByLineViewModelProtocol
    let stopByLineView: StopByLineView
    let searchController: UISearchController

    init(viewModel: StopByLineViewModelProtocol) {
        self.viewModel = viewModel
        stopByLineView = .init(viewModel: viewModel)
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
        view = stopByLineView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension StopByLineViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text else { return }
        viewModel.requestPosition(search: text)
    }

}
