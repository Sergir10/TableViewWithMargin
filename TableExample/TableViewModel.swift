//
//  TableViewModel.swift
//  TableExample
//
//  Created by Sergio Giraldo on 11/13/19.
//  Copyright © 2019 Sergio Giraldo. All rights reserved.
//

import Foundation

typealias TestConfiguratorCell = TableCellConfigurator<DetailCell, Test>
typealias TestConfiguratorCell2 = TableCellConfigurator<RegisteredNurseCell, Test2>

class TableViewModel {
    let items: [CellConfigurator] = [
        TestConfiguratorCell(item: Test(description: "Sergio")),
        TestConfiguratorCell2(item: Test2(description: "Giraldo"))]
}
