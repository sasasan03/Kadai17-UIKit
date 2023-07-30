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
    
    static let mainStoryboardID = "main"
    
    var items = [
        Item(name: "えんぴつ", isChecked: false),
        Item(name: "消しゴム", isChecked: true),
        Item(name: "ものさし", isChecked: false)
    ]
    
    @IBOutlet weak var itemTableView: UITableView!

    var selectedItemIndex: IndexPath?
    var selecteditemName: String?

    //MARK: AddViewへ遷移させるためのボタン
    @IBAction func toAddButtonAction(_ sender: Any) {
        //AddViewへ遷移することを明示
        let storyboard = UIStoryboard(name: "AddView", bundle: nil)
        //デリゲートを受け取るために使用
        let addView = storyboard.instantiateViewController(withIdentifier: AddViewController.AddSoryboardID) as! AddViewController
        //present()内で使用
        let nav = UINavigationController(rootViewController: addView)
        //MARK: ここでdelegateを任されることを宣言する。これがないと、TextFieldDelegateに適合していたとしても下（extentionで拡張した場所）のメソッドの処理は走らない。
        addView.delegate = self
        self.present(nav, animated: true)
        //TODO: - これがなぜクラッシュするのか調べる
        //let nextView = self.storyboard?.instantiateViewController(withIdentifier: NextViewController.nextSBID) as! NextViewController
    }
    
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
    //MARK: performSegue以外を使って値を渡す。
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let editStoryboard = UIStoryboard(name: "EditView", bundle: nil)
        if let editVC = editStoryboard.instantiateViewController(withIdentifier: EditViewController.editVCIdentifier) as? EditViewController {
            editVC.indexPath = indexPath
            editVC.itemName = items[indexPath.row].name
            present(editVC, animated: true)
        }
    }
}

extension ViewController: TextFieldDelegate {
    func didSaveAdd(name: String) {
        items.append(Item(name: name, isChecked: false))
        itemTableView.reloadData()
    }
    
    func didSaveEdit(name: String, ind: Int) {
        
    }
}
