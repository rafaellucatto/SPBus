//
//  MainViewModelProtocol.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

protocol MainViewModelProtocol {

    var coordinator: MainViewModelDelegate? { get set }
    var vc: UIViewController? { get set }

    func arrivalTimeInfoGotTapped()
    func handleBusPosition()
    func handleBusStopPosition()
    func lineInfoGotTapped()

}
