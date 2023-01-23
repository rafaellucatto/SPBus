//
//  MainView+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

extension MainView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height * 0.18
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            mainViewModel.handleBusPosition()
        case 1:
            mainViewModel.handleBusStopPosition()
        case 2:
            mainViewModel.lineInfoGotTapped()
        case 3:
            mainViewModel.arrivalTimeInfoGotTapped()
        default:
            break
        }
    }

}

extension MainView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 4 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainViewTableViewCell.identifier, for: indexPath) as? MainViewTableViewCell else {
            fatalError("Unable to dequeue cell")
        }
        switch indexPath.row {
        case 0:
            let viewModel: MainViewTableViewCellViewModel = .init(screenCard: .position)
            cell.configure(with: viewModel)
        case 1:
            let viewModel: MainViewTableViewCellViewModel = .init(screenCard: .stops)
            cell.configure(with: viewModel)
        case 2:
            let viewModel: MainViewTableViewCellViewModel = .init(screenCard: .line)
            cell.configure(with: viewModel)
        case 3:
            let viewModel: MainViewTableViewCellViewModel = .init(screenCard: .arrival)
            cell.configure(with: viewModel)
        default:
            break
        }
        return cell
    }

}

