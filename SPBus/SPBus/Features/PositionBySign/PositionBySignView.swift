//
//  PositionBySignView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation
import GoogleMaps
import UIKit

final class PositionBySignView: UIView {

    let googleMapsHandler: GoogleMapsHandler
    var viewModel: PositionBySignViewModelProtocol

    init(viewModel: PositionBySignViewModelProtocol,
         googleMapsHandler: GoogleMapsHandler = .init(),
         frame: CGRect = .zero) {
        self.googleMapsHandler = googleMapsHandler
        self.viewModel = viewModel
        super.init(frame: frame)
        self.viewModel.delegate = self
        addSubview(googleMapsView)
        googleMapsView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        googleMapsView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        googleMapsView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        googleMapsView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var googleMapsView: GMSMapView = {
        let mapView: GMSMapView = googleMapsHandler.getGoogleMapsView(viewFrame: self.bounds)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

}

extension PositionBySignView: PositionBySignViewModelDelegate {

    func clearGoogleMaps() {
        googleMapsView.clear()
    }

    func putPositionBySignOntoMap(model: GoogleMapsMarkModel) {
        let marker: GMSMarker = .init()
        marker.position = CLLocationCoordinate2D(latitude: model.py, longitude: model.px)
        marker.title = model.title
        marker.snippet = model.snippet
        marker.map = googleMapsView
    }

}
