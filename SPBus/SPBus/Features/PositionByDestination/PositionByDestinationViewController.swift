//
//  PositionByDestinationViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class PositionByDestinationViewController: UIViewController {

    var positionByDestinationView: PositionByDestinationView

    let viewModel: PositionByDestinationViewModelProtocol
    let searchController: UISearchController

    init(viewModel: PositionByDestinationViewModelProtocol) {
        self.viewModel = viewModel
        self.positionByDestinationView = .init(viewModel: self.viewModel)
        self.searchController = SearchController()
        super.init(nibName: nil, bundle: Bundle.main)
        title = "Posição por destino"
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Digite o destino"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = positionByDestinationView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension PositionByDestinationViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text else { return }
        viewModel.requestPosition(search: text)
    }

}
