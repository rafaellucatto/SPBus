//
//  MainViewTableViewCellViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class MainViewTableViewCellViewModel {

    let screenCard: ScreenCards

    init(screenCard: ScreenCards) {
        self.screenCard = screenCard
    }

    var text: String {
        switch screenCard {
        case .position:
            return K.MainScreen.positions
        case .stops:
            return K.MainScreen.stops
        case .line:
            return K.MainScreen.line
        case .arrival:
            return K.MainScreen.arrivalTime
        }
    }

    var image: UIImage {
        switch screenCard {
        case .position:
            return K.MainScreen.positionByDestinationImage
        case .stops:
            return K.MainScreen.stopsByLineImage
        case .line:
            return K.MainScreen.lineImage
        case .arrival:
            return K.MainScreen.arrivalTimeImage
        }
    }

}
