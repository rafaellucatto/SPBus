//
//  UINavigationController+Extension.swift
//  Core
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

extension UINavigationController {

    public func setupNavControllerAppearance() {
        let appearance: UINavigationBarAppearance = .init()
        appearance.backgroundEffect = .init(style: UIBlurEffect.Style.dark)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = .white
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
