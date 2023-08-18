//
//  ItemAddEditViewController.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/24.
//

import UIKit
//UITableViewにdelegateというプロパティがあって、その型がUITableViewDelegateである。
//AddViewContorollerにdelegateというプロパティがあって、その型がAddViewControllerDelegateである。

protocol TextFieldDelegate: AnyObject { //MARK: 🟥よくない命名：理由
    func didSaveAdd(name: String)
}

protocol AddViewControllerDelegate: AnyObject { //MARK: 🟥良い命名：理由
    func didSaveAdd(name: String)
}

class AddViewController: UIViewController {//MARK: 🟨ヒントはここにある。
    
    static let AddSoryboardID = "AddView"
    
    weak var delegate: AddViewControllerDelegate?

    @IBOutlet weak var itemTextField: UITextField!
    
    //TODO: ボタンが押されたときに、画面に入力された値を渡す処理方法にかえる。
    @IBAction func didTapSave(_ sender: Any) {
        guard let itemName = itemTextField.text else { return print("🍔：値なし") }
        delegate?.didSaveAdd(name: itemName)//🟦値を取得
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "追加画面"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
    }
}
