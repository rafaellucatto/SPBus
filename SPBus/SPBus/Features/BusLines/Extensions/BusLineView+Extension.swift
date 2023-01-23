//
//  BusLineView+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

extension BusLineView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * 0.3
    }

}

extension BusLineView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        busLineViewModel.lines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LineTableViewCell = tableView.dequeueReusableCell(withIdentifier: LineTableViewCell.identifier, for: indexPath) as? LineTableViewCell else {
            fatalError("Unable to dequeue cell.")
        }
        let lineTableViewCellModel: LineTableViewCellModel = .init(rowNumber: indexPath.row, line: busLineViewModel.lines[indexPath.row])
        let viewModel: LineTableViewCellViewModel = .init(lineCellModel: lineTableViewCellModel)
        cell.configure(with: viewModel)
        return cell
    }

}

extension BusLineView: BusLineViewModelDelegate {

    func displayActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.lineTableView.isHidden = true
            self?.noResultsLabel.isHidden = true
            self?.activityIndicatorView.isHidden = false
        }
    }

    func displayNoResultMessage() {
        DispatchQueue.main.async { [weak self] in
            self?.lineTableView.isHidden = true
            self?.activityIndicatorView.isHidden = true
            self?.noResultsLabel.isHidden = false
        }
    }

    func reloadTableViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicatorView.isHidden = true
            self?.noResultsLabel.isHidden = true
            self?.lineTableView.isHidden = false
            self?.lineTableView.reloadData()
        }
    }

}
