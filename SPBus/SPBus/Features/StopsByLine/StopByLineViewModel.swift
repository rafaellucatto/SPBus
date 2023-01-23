//
//  StopByLineViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

protocol StopByLineViewModelProtocol {
    var requestManager: RequestManagerProtocol { get }
    var delegate: StopByLineViewModelDelegate? { get set }

    func requestPosition(search: String)
}

protocol StopByLineViewModelDelegate: AnyObject {
    func clearGoogleMaps()
    func putStopsByLineOntoMap(stops: [Stop], text: String)
}

final class StopByLineViewModel: StopByLineViewModelProtocol {

    let requestManager: RequestManagerProtocol

    weak var delegate: StopByLineViewModelDelegate?

    init(requestManager: RequestManagerProtocol = RequestManager.shared) {
        self.requestManager = requestManager
    }

    func requestPosition(search: String) {
        if search.isEmpty {
            delegate?.clearGoogleMaps()
            return
        }
        let url: String = "\(K.Urls.baseUrl)\(K.Urls.Stops.byLineCode)\(search)"
        requestManager.fetchListDataFromSPTransForArray(expectedType: Stop.self, url: url) { result in
            switch result {
            case .success(let stops):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.clearGoogleMaps()
                    self?.delegate?.putStopsByLineOntoMap(stops: stops, text: search)
                }
            case .failure(let error):
                print(error.localizedDescription)
                // handle error here
            }
        }
    }

}
