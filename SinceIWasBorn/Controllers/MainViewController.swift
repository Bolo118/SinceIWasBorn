//
//  ViewController.swift
//  SinceIWasBorn
//
//  Created by Adithep on 7/14/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textFieldInput: UITextField!
    
    var years = " "
    var months = " "
    var days = " "
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }

    @IBAction func showTimeButtonTapped(_ sender: UIButton) {
        
    }
    
    
    func createDatePicker() {
        // create toolbar
        let toolbar = UIToolbar()
        
        // adjust size of toolbar to fit the screen
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor.black
        toolbar.tintColor = UIColor.green
        
//        // create done bar button
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTapped))
        

        // assign doneButton to toolbar
        toolbar.setItems([spacer, doneButton], animated: true)
        
        // assign toolbar when tap on textfield
        textFieldInput.inputAccessoryView = toolbar
        
        // assign date picker to the textfield
        textFieldInput.inputView = datePicker
        
        // set date picker mode
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .black
        datePicker.setValue(UIColor.green, forKey: "textColor")
    }
    
    @objc func doneButtonTapped() {
        // create format for date
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        
        // show the selected date on the textfield
        textFieldInput.text = formatter.string(from: datePicker.date)
        // dismiss the toolbar
        self.view.endEditing(true)
    }
}

