//
//  Constants.swift
//  Core
//
//  Created by Rafael Lucatto on 1/21/23.
//

import Foundation
import UIKit

// An enum to write constants to be used throughout the app (kind of SwiftGen)
public enum K {
    public enum MainScreen {
        public static let title: String = "SP Bus"
        public static let arrivalTime: String = "Previsão de chegada"
        public static let arrivalTimeImage: UIImage = .init(systemName: "clock")!
        public static let tableViewCellIdentifier: String = "MainViewTableViewCell"
        public static let line: String = "Linhas"
        public static let lineImage: UIImage = .init(systemName: "arrow.up.arrow.down.circle")!
        public static let positions: String = "Posições dos veículos"
        public static let positionsByDestination: String = "por destino"
        public static let positionsBySign: String = "por letreiro"
        public static let positionByDestinationImage: UIImage = .init(systemName: "mappin.and.ellipse")!
        public static let positionBySignImage: UIImage = .init(systemName: "mappin.and.ellipse")!
        public static let stops: String = "Posições das paradas"
        public static let stopsByLine: String = "por linha"
        public static let stopsByLineImage: UIImage = .init(systemName: "bus")!
        public static let stopsByNameOrAddress: String = "por nome"
        public static let stopsByNameOrAddressImage: UIImage = .init(systemName: "bus")!
    }
    public enum Error {
        public static let requiredInit: String = "init(coder:) has not been implemented"
    }
    public enum Request {
        public static let apiKey: String = "myAPIKeyWasHere"
    }
    public enum Urls {
        public static let baseUrl: String = "http://api.olhovivo.sptrans.com.br/v2.1/"
        public static let fullPostRequest: String = "http://api.olhovivo.sptrans.com.br/v2.1/Login/Autenticar?token=myTokenWasHere"
        public enum ArrivalTimes {
            public static let byStopCode: String = "Previsao/Parada?codigoParada="
        }
        public enum Lines {
            public static let byLine: String = "Linha/Buscar?termosBusca="
        }
        public enum Positions {
            public static let searchPosition: String = "Posicao"
        }
        public enum Stops {
            public static let byLineCode: String = "Parada/BuscarParadasPorLinha?codigoLinha="
            public static let byStopNameOrAddress: String = "Parada/Buscar?termosBusca="
        }
    }
}
