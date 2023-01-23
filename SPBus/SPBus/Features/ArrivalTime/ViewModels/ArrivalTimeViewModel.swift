//
//  ArrivalTimeViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

final class ArrivalTimeViewModel {

    let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager.shared) {
        self.requestManager = requestManager
    }

    var vehicles: [VehicleAndItsLine] = []

    weak var arrivalTimeViewModelDelegate: ArrivalTimeViewModelDelegate?

    func getArrivalTimes(text: String) {
        let url: String = "\(K.Urls.baseUrl)\(K.Urls.ArrivalTimes.byStopCode)\(text)"
        requestManager.fetchListDataFromSPTrans(expectedType: ArrivalTime.self, url: url) { [weak self] result in
            switch result {
            case .success(let _times):
                self?.vehicles.removeAll()
                for lines in _times.p?.l ?? [] {
                    for vehicles in lines.vs {
                        self?.vehicles.append(VehicleAndItsLine(lineDestination: lines.lt0, arrivalTime: vehicles.t))
                    }
                }
                if self?.vehicles.count ?? 0 > 0 {
                    self?.arrivalTimeViewModelDelegate?.displayTimes(busArrivalTimes: self?.vehicles ?? [])
                    return
                }
                self?.arrivalTimeViewModelDelegate?.displayNoResultMessage()
            case .failure(let error):
                print(error.localizedDescription)
                self?.arrivalTimeViewModelDelegate?.displayError()
            }
        }
    }

}
