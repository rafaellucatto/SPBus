//
//  PositionBySignViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

protocol PositionBySignViewModelDelegate: AnyObject {
    func clearGoogleMaps()
    func putPositionBySignOntoMap(model: GoogleMapsMarkModel)
}

protocol PositionBySignViewModelProtocol {
    var requestManager: RequestManagerProtocol { get }
    var delegate: PositionBySignViewModelDelegate? { get set }

    func requestPosition(search: String)
}

final class PositionBySignViewModel: PositionBySignViewModelProtocol {

    let requestManager: RequestManagerProtocol

    weak var delegate: PositionBySignViewModelDelegate?

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
                    for lines in positions.l {
                        if lines.c.lowercased().contains(search.lowercased()) {
                            for vs in lines.vs {
                                let model: GoogleMapsMarkModel = .init(py: vs.py,
                                                                       px: vs.px,
                                                                       title: "Destino: \(lines.lt0)",
                                                                       snippet: "Letreiro: \(lines.c)")
                                self?.delegate?.putPositionBySignOntoMap(model: model)
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
