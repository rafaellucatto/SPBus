//
//  ArrivalTimeViewModelDelegate.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

protocol ArrivalTimeViewModelDelegate: AnyObject {

    func displayActivityIndicator()
    func displayError()
    func displayNoResultMessage()
    func displayTimes(busArrivalTimes: [VehicleAndItsLine])

}
