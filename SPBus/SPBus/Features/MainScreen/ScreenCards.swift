//
//  ScreenCards.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

/// An enum to handle the screen the user wants to go to (based on the four buttons on the main screen)
enum ScreenCards {
    /// Locates bus positions in real time, uses Google Maps
    case position
    /// Shows bus stop locations, uses Google Maps
    case stops
    /// Gives information about the bus line
    case line
    /// Gives information about what buses are to come to a certain bus stop (the bus stop id code can be obtained from the bus stop screen map, aka the ".stops" view)
    case arrival
}
