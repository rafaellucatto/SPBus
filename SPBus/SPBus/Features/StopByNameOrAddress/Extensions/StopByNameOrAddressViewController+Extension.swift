//
//  StopByNameOrAddressViewController+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

extension StopByNameOrAddressViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text else { return }
        viewModel.requestPosition(search: text)
    }

}
