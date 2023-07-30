//
//  ItemAddEditViewController.swift
//  Kadai17-UIKit
//
//  Created by sako0602 on 2023/07/24.
//

import UIKit

protocol TextFieldDelegate: AnyObject {
    func didSaveAdd(name: String)
    func didSaveEdit(name: String, ind: Int)
}

class AddViewController: UIViewController {
    
    static let AddSoryboardID = "AddView"
    
    weak var delegate: TextFieldDelegate?

    @IBOutlet weak var itemTextField: UITextField!
    
    //TODO: ボタンが押されたときに、画面に入力された値を渡す処理方法にかえる。
    @IBAction func didTapSave(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // let VC = storyboard.instantiateViewController(withIdentifier: ViewController.mainStoryboardID) as! ViewController
        guard let itemName = itemTextField.text else { return print("🍔：値なし") }
        delegate?.didSaveAdd(name: itemName)
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
