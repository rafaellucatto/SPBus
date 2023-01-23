//
//  ArrivalTimeViewController+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

extension ArrivalTimeViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text: String = searchController.searchBar.text, text.count > 0 else {
            arrivalTimeMessageView.isHidden = false
            arrivalTimeViewModel.setupInitialView()
            return
        }
        arrivalTimeMessageView.isHidden = true
        arrivalTimeViewModel.handleResult(search: text)
    }

}
