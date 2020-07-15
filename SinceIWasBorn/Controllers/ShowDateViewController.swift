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
    var birthDate = " "
    
    let calendar = Calendar.current
    let now = Date()
    let numberFormatter = NumberFormatter()
    
    
    @IBOutlet weak var showDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDateLabel.text = "Year: \(showYear) Month: \(showMonth) Day: \(showDay)"
    }
    
    @IBAction func selectedButtonTapped(_ sender: UIButton) {
        
        let dateComponents = DateComponents(calendar: calendar, year: Int(showYear), month: Int(showMonth), day: Int(showDay))
        let composedDate = calendar.date(from: dateComponents)
        numberFormatter.numberStyle = .decimal
        
        let components = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: composedDate!, to: now)
        
        let yearLabel = calendar.dateComponents([.year], from: composedDate!, to: now).year
        let monthLabel = calendar.dateComponents([.month], from: composedDate!, to: now).month
        let dayLabel = calendar.dateComponents([.day], from: composedDate!, to: now).day
        
        let hourLabel = calendar.dateComponents([.hour], from: composedDate!, to: now).hour
        let hourLabelFormat = numberFormatter.string(from: NSNumber(value: hourLabel!))
        
        let minuteLabel = calendar.dateComponents([.minute], from: composedDate!, to: now).minute
        let minuteLabelFormat = numberFormatter.string(from: NSNumber(value: minuteLabel!))
        
        let secondLabel = calendar.dateComponents([.second], from: composedDate!, to: now).second
        let secondLabelFormat = numberFormatter.string(from: NSNumber(value: secondLabel!))
        
        switch sender.tag {
        case 0:
            birthDate = "SHOW ALL"
            showDateLabel.text = birthDate
        case 1:
            birthDate = "\(String(describing: yearLabel!)) years"
            showDateLabel.text = birthDate
        case 2:
            birthDate = "\(String(describing: monthLabel!)) months"
            showDateLabel.text = birthDate
        case 3:
            birthDate = "\(String(describing: dayLabel!)) days"
            showDateLabel.text = birthDate
        case 4:
            birthDate = "\(String(describing: hourLabelFormat!)) hours"
            showDateLabel.text = birthDate
        case 5:
            birthDate = "\(String(describing: minuteLabelFormat!)) minutes"
            showDateLabel.text = birthDate
        case 6:
            birthDate = "\(String(describing: secondLabelFormat!)) seconds"
            showDateLabel.text = birthDate
        default:
            print("Something else")
        }
    }
    
}
