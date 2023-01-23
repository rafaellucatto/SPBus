//
//  ArrivalTimeViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class ArrivalTimeViewController: UIViewController {

    var arrivalTimeMessageView: ArrivalTimeMessageView
    var arrivalTimeResults: ArrivalTimeResultsViewController
    var arrivalTimeViewModel: ArrivalTimeViewModelProtocol
    var searchController: UISearchController

    init(arrivalTimeViewModel: ArrivalTimeViewModelProtocol) {
        self.arrivalTimeViewModel = arrivalTimeViewModel
        arrivalTimeResults = .init(arrivalTimeViewModel: self.arrivalTimeViewModel)
        self.arrivalTimeViewModel.arrivalTimeViewModelDelegate = arrivalTimeResults.arrivalTimeView
        searchController = SearchController(searchResultsController: self.arrivalTimeResults)
        arrivalTimeResults.arrivalTimeView.arrivalTimeViewModel = self.arrivalTimeViewModel
        arrivalTimeMessageView = .init()
        super.init(nibName: nil, bundle: Bundle.main)
        title = "Previsão"
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Número da parada"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = arrivalTimeMessageView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
