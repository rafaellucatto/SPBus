//
//  ArrivalTimeView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

final class ArrivalTimeView: UIView {

    var arrivalTimeViewModel: ArrivalTimeViewModelProtocol

    init(arrivalTimeViewModel: ArrivalTimeViewModelProtocol, frame: CGRect = .zero) {
        self.arrivalTimeViewModel = arrivalTimeViewModel
        super.init(frame: frame)
        backgroundColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(arrivalTimeTableView)
        addSubview(noResultsLabel)
        addSubview(activityIndicatorView)
        setupArrivalTimeTableViewConstraints()
        setupNoResultsLabelConstraints()
        setupActivityIndicatorViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var arrivalTimeTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        $0.register(ArrivalTimeTableViewCell.self, forCellReuseIdentifier: ArrivalTimeTableViewCell.identifier)
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

    private func setupArrivalTimeTableViewConstraints() {
        arrivalTimeTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        arrivalTimeTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        arrivalTimeTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        arrivalTimeTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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
