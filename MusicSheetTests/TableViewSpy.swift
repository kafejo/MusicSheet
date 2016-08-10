//
//  TableViewSpy.swift
//  MusicSheet
//
//  Created by Aleš Kocur on 10/08/16.
//  Copyright © 2016 Rubicoin. All rights reserved.
//

import UIKit

class TableViewSpy: UITableView {
    var reloadDataCalled = false
    override func reloadData() {
        super.reloadData()
        reloadDataCalled = true
    }
}
