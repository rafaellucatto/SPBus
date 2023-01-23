//
//  ArrivalTimeView+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

extension ArrivalTimeView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * 0.12
    }

}

extension ArrivalTimeView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrivalTimeViewModel.vehicles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ArrivalTimeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ArrivalTimeTableViewCell.identifier,
                                                                                 for: indexPath) as? ArrivalTimeTableViewCell else {
            fatalError("Unable to dequeue cell.")
        }
        let arrivalTimeCellModel: ArrivalTimeCellModel = .init(rowNumberLabel: indexPath.row,
                                                               arrivalTime: arrivalTimeViewModel.vehicles[indexPath.row].arrivalTime,
                                                               lineDestination: arrivalTimeViewModel.vehicles[indexPath.row].lineDestination)
        let viewModel: ArrivalTimeTableViewCellViewModel = .init(arrivalTimeCellModel: arrivalTimeCellModel)
        cell.configure(with: viewModel)
        return cell
    }

}

extension ArrivalTimeView: ArrivalTimeViewModelDelegate {

    func displayActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.noResultsLabel.isHidden = true
            self?.activityIndicatorView.isHidden = false
            self?.arrivalTimeTableView.isHidden = true
        }
    }

    func displayTimes(busArrivalTimes: [VehicleAndItsLine]) {
        DispatchQueue.main.async { [weak self] in
            self?.noResultsLabel.isHidden = true
            self?.activityIndicatorView.isHidden = true
            self?.arrivalTimeTableView.isHidden = false
            self?.arrivalTimeTableView.reloadData()
        }
    }

    // TODO: to implement view, message or something in case an error occurs
    func displayError() {}

    func displayNoResultMessage() {
        DispatchQueue.main.async { [weak self] in
            self?.arrivalTimeTableView.isHidden = true
            self?.activityIndicatorView.isHidden = true
            self?.noResultsLabel.isHidden = false
        }
    }

}
