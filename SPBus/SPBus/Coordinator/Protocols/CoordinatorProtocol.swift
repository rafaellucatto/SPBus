//
//  CoordinatorProtocol.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {

    var navigationController: UINavigationController { get }
    var window: UIWindow { get }

    func start()

}
