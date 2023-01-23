//
//  ArrivalTimeResultsProtocol.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

protocol ArrivalTimeResultsProtocol {

    var arrivalTimeView: ArrivalTimeView { get set }
    var arrivalTimeViewModel: ArrivalTimeViewModelProtocol { get set }

}
