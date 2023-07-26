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

class ItemAddEditViewController: UIViewController {
    
    static let editSegueIdentifier = "editSegue"
    static let addSegueIdentifier = "addSegue"
    static let itemAddEditViewSoryboardID = "ItemAddEditView"
    
    weak private var delegate: TextFieldDelegate?

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func didTapSave(_ sender: Any) {
        
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
