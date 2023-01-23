//
//  BusLineResultsViewController.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

final class BusLineResultsViewController: UIViewController {

    var busLineView: BusLineView
    var busLineViewModel: BusLineViewModelProtocol

    init(busLineViewModel: BusLineViewModelProtocol) {
        self.busLineViewModel = busLineViewModel
        busLineView = .init(busLineViewModel: self.busLineViewModel)
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = busLineView
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
