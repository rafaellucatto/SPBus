//
//  StopByNameOrAddressViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

protocol StopByNameOrAddressViewModelProtocol {
    var delegate: StopByNameOrAddressViewModelDelegate? { get set }

    func requestPosition(search: String)
}

protocol StopByNameOrAddressViewModelDelegate: AnyObject {
    func clearGoogleMaps()
    func putStopsOntoMap(model: GoogleMapsMarkModel)
}

final class StopByNameOrAddressViewModel: StopByNameOrAddressViewModelProtocol {

    let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager.shared) {
        self.requestManager = requestManager
    }

    weak var delegate: StopByNameOrAddressViewModelDelegate?

    func requestPosition(search: String) {
        if search.isEmpty {
            delegate?.clearGoogleMaps()
            return
        }
        let url: String = "\(K.Urls.baseUrl)\(K.Urls.Stops.byStopNameOrAddress)"
        requestManager.fetchListDataFromSPTransForArray(expectedType: Stop.self, url: url) { result in
            switch result {
            case .success(let stops):
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.clearGoogleMaps()
                    for stop in stops {
                        if stop.np.lowercased().contains(search.lowercased()) {
                            let model: GoogleMapsMarkModel = .init(py: stop.py,
                                                                   px: stop.px,
                                                                   title: "\(stop.np)",
                                                                   snippet: "\(stop.cp)")
                            self?.delegate?.putStopsOntoMap(model: model)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                // handle error here
            }
        }
    }

}
