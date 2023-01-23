//
//  LineTableViewCell.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Core
import Foundation
import UIKit

final class LineTableViewCell: UITableViewCell {

    static let identifier: String = "LineInfoTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(overView)
        overView.addSubview(rowNumberLabel)
        overView.addSubview(lineWiseLabel)
        setupOverViewConstraints()
        setupRowNumberLabelConstraints()
        setupLineWiseLabelConstraints()
    }

    lazy var rowNumberLabel: UILabel = {
        $0.numberOfLines = 0
        $0.backgroundColor = .gray
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "Row 0"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var lineWiseLabel: UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .justified
        $0.textColor = .white
        $0.text = "LineInfo"
        $0.backgroundColor = .darkGray
        return $0
    }(UILabel())

    lazy var overView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 12
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 5
        $0.clipsToBounds = true
        return $0
    }(UIView())

    private func setupOverViewConstraints() {
        let widthPadding: CGFloat = contentView.bounds.width * 0.1
        let heightPadding: CGFloat = contentView.bounds.height * 0.08
        overView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: widthPadding).isActive = true
        overView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: heightPadding).isActive = true
        overView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -widthPadding).isActive = true
        overView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -heightPadding).isActive = true
    }

    private func setupRowNumberLabelConstraints() {
        rowNumberLabel.leftAnchor.constraint(equalTo: overView.leftAnchor).isActive = true
        rowNumberLabel.topAnchor.constraint(equalTo: overView.topAnchor).isActive = true
        rowNumberLabel.rightAnchor.constraint(equalTo: overView.rightAnchor).isActive = true
        rowNumberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    private func setupLineWiseLabelConstraints() {
        lineWiseLabel.leftAnchor.constraint(equalTo: overView.leftAnchor).isActive = true
        lineWiseLabel.topAnchor.constraint(equalTo: rowNumberLabel.bottomAnchor).isActive = true
        lineWiseLabel.rightAnchor.constraint(equalTo: overView.rightAnchor).isActive = true
        lineWiseLabel.bottomAnchor.constraint(equalTo: overView.bottomAnchor).isActive = true
    }

    func configure(with viewModel: LineTableViewCellViewModel) {
        rowNumberLabel.text = viewModel.rowNumber
        lineWiseLabel.text = viewModel.lineLabel
    }

}
