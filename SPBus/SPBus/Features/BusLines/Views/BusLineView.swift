//
//  BusLineView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

final class BusLineView: UIView {

    var busLineViewModel: BusLineViewModelProtocol

    init(busLineViewModel: BusLineViewModelProtocol, frame: CGRect = .zero) {
        self.busLineViewModel = busLineViewModel
        super.init(frame: frame)
        backgroundColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(lineTableView)
        addSubview(noResultsLabel)
        addSubview(activityIndicatorView)
        setupLineTableViewConstraints()
        setupNoResultsLabelConstraints()
        setupActivityIndicatorViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Properties
    lazy var lineTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.register(LineTableViewCell.self, forCellReuseIdentifier: LineTableViewCell.identifier)
        return $0
    }(UITableView())

    lazy var activityIndicatorView: UIActivityIndicatorView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.startAnimating()
        $0.color = .red
        return $0
    }(UIActivityIndicatorView(style: .large))

    lazy var noResultsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.backgroundColor = .clear
        $0.text = "Oops! Não foi possível encontrar resultados para a sua pesquisa"
        $0.textColor = .white
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    // MARK: - Constraints
    private func setupLineTableViewConstraints() {
        lineTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lineTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setupActivityIndicatorViewConstraints() {
        setupMessageConstraints(view: activityIndicatorView)
    }

    private func setupNoResultsLabelConstraints() {
        setupMessageConstraints(view: noResultsLabel)
    }

    private func setupMessageConstraints(view: UIView) {
        view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.4).isActive = true
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.4).isActive = true
    }

}

