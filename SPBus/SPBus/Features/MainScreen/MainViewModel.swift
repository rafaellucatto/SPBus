//
//  MainView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/21/23.
//

import Core
import Foundation
import UIKit

/// ViewModel of the opening screen
final class MainViewModel: MainViewModelProtocol {

    var coordinator: MainViewModelDelegate? // this one CANNOT be weak

    weak var vc: UIViewController?
    
    /// Directs the user to expected page
    func lineInfoGotTapped() {
        coordinator?.goTo(.line)
    }

    /// Directs the user to expected page
    func arrivalTimeInfoGotTapped() {
        coordinator?.goTo(.arrivalTime)
    }
    
    /// Creates two options for the user to choose regarding the bus position on the map
    func handleBusPosition() {
        let alert: UIAlertController = .init(title: "Procurar a posição dos ônibus...", message: nil, preferredStyle: .actionSheet)
        let action: UIAlertAction = .init(title: "por destino", style: UIAlertAction.Style.default) { [weak self] _ in
            self?.coordinator?.goTo(.positionsByDestination)
        }
        let action2: UIAlertAction = .init(title: "por letreiro", style: UIAlertAction.Style.default) { [weak self] _ in
            self?.coordinator?.goTo(.positionsBySign)
        }
        let action3: UIAlertAction = .init(title: "Cancelar", style: UIAlertAction.Style.cancel)
        alert.addAction(action)
        alert.addAction(action2)
        alert.addAction(action3)
        vc?.present(alert, animated: true)
    }
    
    /// Creates two options for the user to choose regarding the bus stop locations on the map
    func handleBusStopPosition() {
        let alert: UIAlertController = .init(title: "Procurar a posição das paradas...", message: nil, preferredStyle: .actionSheet)
        let action: UIAlertAction = .init(title: "por linha", style: UIAlertAction.Style.default) { [weak self] _ in
            self?.coordinator?.goTo(.stopsByLine)
        }
        let action2: UIAlertAction = .init(title: "por nome ou por endereço", style: UIAlertAction.Style.default) { [weak self] _ in
            self?.coordinator?.goTo(.stopsByNameOrAddress)
        }
        let action3: UIAlertAction = .init(title: "Cancelar", style: UIAlertAction.Style.cancel)
        alert.addAction(action)
        alert.addAction(action2)
        alert.addAction(action3)
        vc?.present(alert, animated: true)
    }

}
