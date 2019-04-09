//
//  TableViewCell.swift
//  IosDemo
//
//  Created by huissoudyann on 4/7/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import UIKit

protocol ContactTap {
    func performSegue(forContactAtPosition position: Int)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
}
