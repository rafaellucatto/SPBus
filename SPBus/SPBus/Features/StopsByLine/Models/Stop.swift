//
//  Stop.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

struct Stop: Codable {
    /// código identificador da parada
    var cp: Int = 0
    /// nome da parada
    var np: String = ""
    /// endereço de locaclização da parada
    var ed: String = ""
    /// latitude
    var py: Double = 0.0
    /// longitude
    var px: Double = 0.0
}
