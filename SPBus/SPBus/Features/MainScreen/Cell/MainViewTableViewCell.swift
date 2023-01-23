//
//  MainViewTableViewCell.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class MainViewTableViewCell: UITableViewCell {

    static let identifier: String = "MainScreenViewTableViewCell"

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        selectionStyle = .none
        addAllSubviews()
        setupAllConstraints()
    }

    private func addAllSubviews() {
        contentView.addSubview(overView)
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellText)
    }

    private func setupAllConstraints() {
        setupOverViewConstraints()
        setupCellImageViewConstraints()
        setupCellTextConstraints()
    }

    lazy var overView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.1592884958, green: 0.1592884958, blue: 0.1592884958, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        return $0
    }(UIView())

    lazy var cellImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = K.MainScreen.positionByDestinationImage
        $0.tintColor = .white
        return $0
    }(UIImageView())

    lazy var cellText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "here I am"
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())

    func configure(with viewModel: MainViewTableViewCellViewModel) {
        cellText.text = viewModel.text
        cellImageView.image = viewModel.image
    }

    private func setupOverViewConstraints() {
        let widthPadding: CGFloat = contentView.bounds.width * 0.1
        let heightPadding: CGFloat = contentView.bounds.height * 0.08
        overView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: widthPadding).isActive = true
        overView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightPadding).isActive = true
        overView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -widthPadding).isActive = true
        overView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -heightPadding).isActive = true
    }

    private func setupCellImageViewConstraints() {
        cellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: overView.topAnchor, constant: contentView.bounds.height * 0.15).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.3).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.height * 0.3).isActive = true
    }

    private func setupCellTextConstraints() {
        cellText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellText.bottomAnchor.constraint(equalTo: overView.bottomAnchor, constant: -contentView.bounds.height * 0.13).isActive = true
    }

}
