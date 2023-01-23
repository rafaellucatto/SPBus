//
//  ArrivalTimeBusStop.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

struct ArrivalTimeBusStop: Decodable {
    var l: [ArrivalTimeBusLine] = [] /// linha correspondente
}
