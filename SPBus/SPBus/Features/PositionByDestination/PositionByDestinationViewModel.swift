//
//  PositionByDestinationViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

protocol PositionByDestinationViewModelProtocol {
    var requestManager: RequestManagerProtocol { get }
    var delegate: PositionByDestinationViewModelDelegate? { get set }

    func requestPosition(search: String)
}

protocol PositionByDestinationViewModelDelegate: AnyObject {
    func clearGoogleMaps()
    func putPositionByDestinationOntoMap(model: GoogleMapsMarkModel)
}

final class PositionByDestinationViewModel: PositionByDestinationViewModelProtocol {

    let requestManager: RequestManagerProtocol

    weak var delegate: PositionByDestinationViewModelDelegate?

    init(requestManager: RequestManagerProtocol = RequestManager.shared) {
        self.requestManager = requestManager
    }

    func requestPosition(search: String) {
        if search.isEmpty {
            delegate?.clearGoogleMaps()
            return
        }
        let url: String = "\(K.Urls.baseUrl)\(K.Urls.Positions.searchPosition)"
        requestManager.fetchListDataFromSPTrans(expectedType: Position.self, url: url) { result in
            switch result {
            case .success(let positions):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.clearGoogleMaps()
                    for lines in positions.l where lines.lt0.lowercased().contains(search.lowercased()) {
                        for vs in lines.vs {
                            let model: GoogleMapsMarkModel = .init(py: vs.py,
                                                                   px: vs.px,
                                                                   title: "Destino: \(lines.lt0)",
                                                                   snippet: "Letreiro: \(lines.c)")
                            self?.delegate?.putPositionByDestinationOntoMap(model: model)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
