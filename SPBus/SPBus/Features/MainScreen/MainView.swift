//
//  MainViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/21/23.
//

import Core
import Foundation
import UIKit

/// A simple view to handle the four actions this app is going to have
final class MainView: UIView {

    var mainViewModel: MainViewModelProtocol

    init(mainViewModel: MainViewModelProtocol, frame: CGRect = .zero) {
        self.mainViewModel = mainViewModel
        super.init(frame: frame)
        addAllSubviews()
        setupAllConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addAllSubviews() {
        addSubview(mainScreenTableView)
    }

    private func setupAllConstraints() {
        setupMainScreenTableViewConstraints()
    }
    
    /// The only subview the MainView has
    lazy var mainScreenTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.register(MainViewTableViewCell.self, forCellReuseIdentifier: MainViewTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView())

    private func setupMainScreenTableViewConstraints() {
        mainScreenTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainScreenTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainScreenTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainScreenTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
