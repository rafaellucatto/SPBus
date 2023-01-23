//
//  GoogleMapsHandler.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/21/23.
//

import Core
import Foundation
import GoogleMaps

class GoogleMapsHandler {

    func getGoogleMapsView(viewFrame: CGRect) -> GMSMapView {
        GMSServices.provideAPIKey(K.Request.apiKey)
        let camera: GMSCameraPosition = .camera(withLatitude: -23.65, longitude: -46.65, zoom: 10.5)
        let mapView: GMSMapView = .map(withFrame: viewFrame, camera: camera)
        return mapView
    }

}
