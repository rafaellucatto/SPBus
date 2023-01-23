//
//  PositionBySignViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class PositionBySignViewController: UIViewController {

    var positionBySignView: PositionBySignView

    let viewModel: PositionBySignViewModelProtocol
    let searchController: UISearchController

    init(viewModel: PositionBySignViewModelProtocol) {
        self.viewModel = viewModel
        positionBySignView = .init(viewModel: self.viewModel)
        searchController = SearchController()
        super.init(nibName: nil, bundle: Bundle.main)
        title = "Posição por letreiro"
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
        view = positionBySignView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension PositionBySignViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text else { return }
        viewModel.requestPosition(search: text)
    }

}
