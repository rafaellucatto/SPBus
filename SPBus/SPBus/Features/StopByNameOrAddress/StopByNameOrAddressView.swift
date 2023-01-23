//
//  StopByNameOrAddressView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import GoogleMaps
import UIKit

final class StopByNameOrAddressView: UIView {

    let googleMapsHandler: GoogleMapsHandler

    var viewModel: StopByNameOrAddressViewModelProtocol

    init(viewModel: StopByNameOrAddressViewModelProtocol,
         googleMapsHandler: GoogleMapsHandler = .init(),
         frame: CGRect = .zero) {
        self.viewModel = viewModel
        self.googleMapsHandler = googleMapsHandler
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

