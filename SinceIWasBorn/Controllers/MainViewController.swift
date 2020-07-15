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
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: datePicker.date)
        years = year
        
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: datePicker.date)
        months = month
        
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: datePicker.date)
        days = day
        
        performSegue(withIdentifier: "toShowDate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowDate" {
            let destinationVC = segue.destination as! ShowDateViewController
            destinationVC.showYear = years
            destinationVC.showMonth = months
            destinationVC.showDay = days
            
            
        }
    }
    
    func createDatePicker() {
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 45.0))
        toolbar.barTintColor = UIColor.black
        toolbar.tintColor = UIColor.green
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTapped))
        toolbar.items = [spacer, doneButton]
        
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

