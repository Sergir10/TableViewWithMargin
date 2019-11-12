//
//  DetailCell.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/11/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 10

        return UIView()
    }()

    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10

        return stack
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)

        return label
    }()

    lazy var valueLabel: UILabel = {
        let label = UILabel()

        return label
    }()


    required init?(coder: NSCoder) {
        fatalError("Init from storyviews does not implemented yet")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.frame = self.frame.inset(by: margins)
    }

    func setupView() {
        self.setupLabels()
        self.setupStackView()
    }

    func setupLabels() {
        self.verticalStackView.addArrangedSubview(self.titleLabel)
        self.verticalStackView.addArrangedSubview(self.valueLabel)
        self.setupLabelsConstraints()
    }

    func setupLabelsConstraints() {
        self.titleLabel.widthAnchor.constraint(equalTo: self.titleLabel.superview!.widthAnchor, multiplier: 0.3).isActive = true
    }

    func setupStackView() {
        self.addSubview(self.verticalStackView)
        self.setupStackViewConstraints()
    }

    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
