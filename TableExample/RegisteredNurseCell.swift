//
//  RegisteredNurseCell.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/11/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import UIKit

class RegisteredNurseCell: UITableViewCell, ConfigurableCell {

    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 0

        return stack
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Registered Nurse"

        return label
    }()

    lazy var positionIdContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0

        return stack
    }()

    lazy var positionIdStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 5

        return stack
    }()

    lazy var positionIdLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "Position ID"

        return label
    }()

    lazy var positionIdLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""

        return label
    }()

    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.separator
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true

        return view
    }()

    lazy var statusLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "Status"

        return label
    }()

    lazy var statusContainerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 5

        return stack
    }()

    lazy var statusLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""

        return label
    }()

    lazy var statusIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit

        return image
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

    func configure(data: Test2) {
        print("Resistered Nurse")
    }

    func setupView() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.setupVerticalStack()
        self.setupVerticalStackContent()
    }

    func setupVerticalStack() {
        self.addSubview(self.verticalStackView)
        self.setupVerticalStackConstraints()
    }

    func setupVerticalStackConstraints() {
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    func setupVerticalStackContent() {
        self.verticalStackView.addArrangedSubview(self.titleLabel)
        self.setupPositionIdLabels()
        self.setupStatusLabels()
    }

    func setupPositionIdLabels() {
        self.verticalStackView.addArrangedSubview(self.positionIdContainerStackView)
        self.positionIdContainerStackView.addArrangedSubview(self.positionIdStackView)
        self.positionIdContainerStackView.addArrangedSubview(self.separatorView)
        self.positionIdStackView.addArrangedSubview(self.positionIdLabelTitle)
        self.positionIdStackView.addArrangedSubview(self.positionIdLabelValue)
        self.setupPositionIdLabelsConstraints()
    }

    func setupPositionIdLabelsConstraints() {
        self.positionIdLabelTitle.widthAnchor.constraint(equalTo: self.positionIdStackView.widthAnchor, multiplier: 0.3).isActive = true
    }

    func setupStatusLabels() {
        self.verticalStackView.addArrangedSubview(self.statusContainerStack)
        self.statusContainerStack.addArrangedSubview(self.statusLabelTitle)
        self.statusContainerStack.addArrangedSubview(self.statusIcon)
        self.statusContainerStack.addArrangedSubview(self.statusLabelValue)
        self.setupStatusConstraints()
    }

    func setupStatusConstraints() {
        self.statusLabelTitle.widthAnchor.constraint(equalTo: self.statusLabelTitle.superview!.widthAnchor, multiplier: 0.3).isActive = true
        self.statusIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
