//
//  Coordinator+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

extension Coordinator: MainViewModelDelegate {

    /// Handles screen transition depending on the screen that was chosen. To see details about each screen, look for the ScreenCards.swift documentation
    /// - Parameter screen: the screen the user wants to go to
    func goTo(_ screen: Screens) {
        switch screen {
        case .positionsByDestination:
            let viewModel: PositionByDestinationViewModelProtocol = PositionByDestinationViewModel()
            let positionByDestinationViewController: PositionByDestinationViewController = .init(viewModel: viewModel)
            navigationController.pushViewController(positionByDestinationViewController, animated: true)
        case .positionsBySign:
            let viewModel: PositionBySignViewModelProtocol = PositionBySignViewModel()
            let positionBySignViewController: PositionBySignViewController = .init(viewModel: viewModel)
            navigationController.pushViewController(positionBySignViewController, animated: true)
        case .stopsByNameOrAddress:
            let viewModel: StopByNameOrAddressViewModelProtocol = StopByNameOrAddressViewModel()
            let stopByNameOrAddressViewController: StopByNameOrAddressViewController = .init(viewModel: viewModel)
            navigationController.pushViewController(stopByNameOrAddressViewController, animated: true)
        case .stopsByLine:
            let viewModel: StopByLineViewModelProtocol = StopByLineViewModel()
            let stopByLineViewController: StopByLineViewController = .init(viewModel: viewModel)
            navigationController.pushViewController(stopByLineViewController, animated: true)
        case .line:
            let viewModel: BusLineViewModelProtocol = BusLineViewModel()
            let busLineViewController: BusLineViewController = .init(busLineViewModel: viewModel)
            navigationController.pushViewController(busLineViewController, animated: true)
        case .arrivalTime:
            let viewModel: ArrivalTimeViewModelProtocol = ArrivalTimeViewModel()
            let arrivalTimeViewController: ArrivalTimeViewController = .init(arrivalTimeViewModel: viewModel)
            navigationController.pushViewController(arrivalTimeViewController, animated: true)
        }
    }

}
