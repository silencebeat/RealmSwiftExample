//
//  EditViewController.swift
//  RealmExample
//
//  Created by algo on 5/17/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var fieldName: UITextField!
    @IBOutlet var fieldAddress: UITextField!
    
    var name = ""
    var address = ""
    
    override func viewDidLoad() {
        
        fieldName.text = name
        fieldAddress.text = address
    }
    
    
    @IBAction func addbtnTapped(sender: AnyObject) {
        
        guard let txtName = fieldName.text where !txtName.isEmpty else {
            return
        }
        
        guard let txtAddress = fieldAddress.text where !txtAddress.isEmpty else {
            return
        }
        
        let model = ClassModel()
        model.address = fieldAddress.text!
        model.name = fieldName.text!
        
        DbHelper.update(model)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
