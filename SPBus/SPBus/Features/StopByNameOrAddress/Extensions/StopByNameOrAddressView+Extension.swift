//
//  StopByNameOrAddressView+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import GoogleMaps

extension StopByNameOrAddressView: StopByNameOrAddressViewModelDelegate {

    func clearGoogleMaps() {
        googleMapsView.clear()
    }

    func putStopsOntoMap(model: GoogleMapsMarkModel) {
        let marker: GMSMarker = .init()
        marker.position = CLLocationCoordinate2D(latitude: model.py, longitude: model.px)
        marker.title = model.title
        marker.snippet = model.snippet
        marker.map = googleMapsView
    }

}
