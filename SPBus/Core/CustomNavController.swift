//
//  CustomNavController.swift
//  Core
//
//  Created by Rafael Lucatto on 1/21/23.
//

import Foundation
import UIKit

/// A custom navigation controller to handle preferredStatusBarStyle
final public class CustomNavController: UINavigationController {

    override public var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    override public var childForStatusBarHidden: UIViewController? {
        topViewController
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}
