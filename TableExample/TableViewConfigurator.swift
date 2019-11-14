//
//  TableViewConfigurator.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/13/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    static var reuseId: String { return String(describing: CellType.self) }

    let item: DataType

    init(item: DataType) {
        self.item = item
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}

struct Test {
    var description: String = "Holi"

    init(description: String) {
        self.description = description
    }
}

struct Test2 {
    var description: String = "Holi 2"

    init(description: String) {
        self.description = description
    }
}
