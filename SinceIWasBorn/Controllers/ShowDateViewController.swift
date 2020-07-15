//
//  ShowDateViewController.swift
//  SinceIWasBorn
//
//  Created by Adithep on 7/14/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit

class ShowDateViewController: UIViewController {
    
    var showYear = " "
    var showMonth = " "
    var showDay = " "
    
    
    @IBOutlet weak var showDateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        showDateLabel.text = "\(showYear) \(showMonth) \(showDay)"
    }
   
    @IBAction func selectedButtonTapped(_ sender: UIButton) {
        
    }
}
