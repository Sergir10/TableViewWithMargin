//
//  WorkgroupCodes.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/11/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import UIKit

class WorkgroupCodes: UITableViewCell {

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
        
    }
}
