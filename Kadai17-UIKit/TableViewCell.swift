//
//  TableViewCell.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let cellNibName = "TableViewCell"
    static let cellIdentifier = "Cell"
    
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var itemText: UILabel!
    
    func configure(item: Item){
        checkMark.image =  UIImage(systemName: item.isChecked ? "checkmark.diamond.fill" : "checkmark.diamond")
        itemText.text = item.name
    } 
}
