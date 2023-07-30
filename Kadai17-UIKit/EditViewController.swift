//
//  EditViewController.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/30.
//

import UIKit

class EditViewController: UIViewController {
    //EditViewControllerは❌nibはstoryboardの名前
    static let nibName = "EditView"
    static let editVCIdentifier = "editView"
    
    var indexPath: IndexPath?
    var itemName: String?
    weak var delgate: TextFieldDelegate?
    
    @IBOutlet weak var editTextField: UITextField!
    
    @IBAction func EditSave(_ sender: Any) {
        guard let index = indexPath?.row, let text = editTextField.text else { return print("🍔：nil") }
        self.delgate?.didSaveEdit(name: text, ind: index)
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editTextField.text = itemName ?? "🍔：値なし"
    }
}
