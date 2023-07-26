//
//  ViewController.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/24.
//

import UIKit
//MARK: 配列の要素を構成するデータモデル型
struct Item {
    var name: String
    var isChecked: Bool
}

class ViewController: UIViewController {
    
    var items = [
        Item(name: "えんぴつ", isChecked: false),
        Item(name: "消しゴム", isChecked: true),
        Item(name: "ものさし", isChecked: false)
    ]
    
    @IBOutlet weak var itemTableView: UITableView!

    var selectedItemIndex: IndexPath?
    var selecteditemName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.dataSource = self
        itemTableView.delegate = self
        itemTableView.register(UINib(nibName: TableViewCell.cellNibName, bundle: nil), forCellReuseIdentifier: TableViewCell.cellIdentifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
        cell.configure(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isChecked.toggle()
        itemTableView.reloadRows(at: [indexPath], with: .middle)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.selecteditemName = items[indexPath.row].name
        self.selectedItemIndex = indexPath
        performSegue(withIdentifier: ItemAddEditViewController.editSegueIdentifier, sender: indexPath)
    }
    
}
