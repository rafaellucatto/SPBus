//
//  ArrivalTimeBusLine.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

struct ArrivalTimeBusLine: Decodable {
    /// letreiro completo
    var c: String = ""
    /// letreiro de destino da linha
    var lt0: String = ""
    /// veículos
    var vs: [ArrivalTimeVehicles] = []
}
