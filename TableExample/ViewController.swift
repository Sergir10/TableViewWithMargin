//
//  ViewController.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/11/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainView()
    let titles = ["Name", "ID", "Email"]
    let names = ["Bill Burd", "102712", "s@gm.com",]
    let sections = ["Section 1", "Section 2", "Section 3"]

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.setTableDelegate(self)
        self.mainView.setTableDataSource(self)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RegisteredNurseCell
        cell.clipsToBounds = true

//        if indexPath.row == 0 {
//            cell.layer.cornerRadius = 10
//            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        }
//
//        if indexPath.row == self.titles.count - 1 {
//            cell.layer.cornerRadius = 10
//            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .lightGray
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])

        label.text = self.sections[section]
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}

class MainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var table: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray

        return tableView
    }()

    func setupView() {
        self.backgroundColor = .white
        self.addSubview(self.table)
        self.setupConstraints()
        self.table.register(RegisteredNurseCell.self, forCellReuseIdentifier: "Cell")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.table.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.table.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.table.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.table.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    func setTableDelegate(_ delegate: UITableViewDelegate) {
        self.table.delegate = delegate
    }

    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        self.table.dataSource = dataSource
    }
}

class CustomCellOne: UITableViewCell {

    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10

        return stack
    }()

    lazy var titleLabel: UILabel = {
        let title = UILabel()

        return title
    }()

    lazy var valueLabel: UILabel = {
        let value = UILabel()

        return value
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let margins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.frame = self.frame.inset(by: margins)
    }

    func setupView() {
        self.setupStackView()
        self.setupCell()
    }

    func setupCell() {
        self.addSubview(self.verticalStack)
        self.setupConstraint()
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.verticalStack.topAnchor.constraint(equalTo: self.topAnchor),
            self.verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }

    func setupStackView() {
        self.verticalStack.addArrangedSubview(self.titleLabel)
        self.verticalStack.addArrangedSubview(self.valueLabel)
    }
}
