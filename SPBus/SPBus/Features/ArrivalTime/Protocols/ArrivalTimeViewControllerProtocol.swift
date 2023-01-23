//
//  ArrivalTimeViewControllerProtocol.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

protocol ArrivalTimeViewControllerProtocol {

    var arrivalTimeMessageView: ArrivalTimeMessageView { get set }
    var arrivalTimeResults: ArrivalTimeResultsViewController { get set }
    var arrivalTimeViewModel: ArrivalTimeViewModelProtocol { get set }
    var searchController: UISearchController { get set }

}
