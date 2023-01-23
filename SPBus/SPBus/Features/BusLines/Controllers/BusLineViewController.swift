//
//  BusLineViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit



final class BusLineViewController: UIViewController {

    var busLineMessageView: BusLineMessageView
    var busLineResults: BusLineResultsViewController
    var busLineViewModel: BusLineViewModelProtocol
    var searchController: UISearchController

    init(busLineViewModel: BusLineViewModelProtocol) {
        self.busLineViewModel = busLineViewModel
        self.busLineResults = .init(busLineViewModel: self.busLineViewModel)
        self.busLineViewModel.busLineViewDelegate = self.busLineResults.busLineView
        self.busLineMessageView = .init()
        self.searchController = SearchController(searchResultsController: self.busLineResults)
        super.init(nibName: nil, bundle: Bundle.main)
        title = "Info Linhas"
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
        view = busLineMessageView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

