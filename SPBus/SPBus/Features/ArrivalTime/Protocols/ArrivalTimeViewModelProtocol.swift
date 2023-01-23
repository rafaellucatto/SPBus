//
//  ArrivalTimeViewModelProtocol.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

protocol ArrivalTimeViewModelProtocol {

    var arrivalTimeViewModelDelegate: ArrivalTimeViewModelDelegate? { get set }
    var vehicles: [VehicleAndItsLine] { get set }
    func handleResult(search: String)
    func setupInitialView()

}
