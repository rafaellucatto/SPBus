//
//  MainViewModelDelegate.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

/// A protocol for the Coordinator.swift to handle screen transition
protocol MainViewModelDelegate: AnyObject {
    func goTo(_ screen: Screens)
}
