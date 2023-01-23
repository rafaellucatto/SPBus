//
//  BusLineViewController+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

extension BusLineViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text, text.count > 0 else {
            busLineViewModel.setupInitialView()
            busLineMessageView.isHidden = false
            return
        }
        busLineMessageView.isHidden = true
        busLineViewModel.handleResult(search: text)
    }

}
