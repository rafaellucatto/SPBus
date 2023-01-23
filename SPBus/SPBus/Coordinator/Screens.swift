//
//  Screens.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

/// An enum to describe the screens for each feature throughout this app
enum Screens {
    /// Gives information about what buses are to come to a certain bus stop (the bus stop id code can be obtained from the bus stop screen map, aka the ".stops" view)
    case arrivalTime
    /// Gives information about the bus line
    case line
    /// Locates bus positions in real time, based on its destination
    case positionsByDestination
    /// Locates bus positions in real time, based on its sign
    case positionsBySign
    /// Shows bus stop locations, based on the bus line whose buses pass by there
    case stopsByLine
    /// Shows bus stop locations, based on its name or the name of the street it is in
    case stopsByNameOrAddress
}
