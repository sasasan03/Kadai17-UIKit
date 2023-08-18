//
//  EditViewController.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/30.

import UIKit

protocol EditViewControllerDelegate: AnyObject {
    func didSaveEdit(name: String, index: Int)
}

class EditViewController: UIViewController {
    //EditViewControllerは❌nibというのはstoryboardの名前
    static let nibName = "EditView"
    static let editVCIdentifier = "editView"
    
    var indexPath: IndexPath?
    var itemName: String?
    weak var delgate: EditViewControllerDelegate?
    
    @IBOutlet weak var editTextField: UITextField!
    
    @IBAction func editSave(_ sender: Any) {
        guard let index = indexPath?.row, let text = editTextField.text else { return print("🍔：nil") }
        
        self.delgate?.didSaveEdit(name: text, index: index)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editTextField.text = itemName ?? "🍔：値なし"
        navigationItem.title = "編集画面"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(editSave))
    }
}
