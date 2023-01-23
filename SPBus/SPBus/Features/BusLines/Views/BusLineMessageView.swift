//
//  BusLineMessageView.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation
import UIKit

final class BusLineMessageView: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .black
        addSubview(centeredLabel)
        setupCenteredLabelConstraints()
    }

    lazy var centeredLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Pesquise pelo número da linha para ver informações."
        $0.textColor = .white
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    private func setupCenteredLabelConstraints() {
        centeredLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        centeredLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        centeredLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        centeredLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true
    }

}
