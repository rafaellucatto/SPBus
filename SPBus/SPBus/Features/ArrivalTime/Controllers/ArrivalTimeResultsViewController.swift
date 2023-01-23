//
//  ArrivalTimeResultsViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

final class ArrivalTimeResultsViewController: UIViewController {

    var arrivalTimeView: ArrivalTimeView
    var arrivalTimeViewModel: ArrivalTimeViewModelProtocol

    init(arrivalTimeViewModel: ArrivalTimeViewModelProtocol) {
        self.arrivalTimeViewModel = arrivalTimeViewModel
        arrivalTimeView = .init(arrivalTimeViewModel: self.arrivalTimeViewModel)
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = arrivalTimeView
    }

}
