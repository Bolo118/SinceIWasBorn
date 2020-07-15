//
//  RoundButton.swift
//  SinceIWasBorn
//
//  Created by Adithep on 7/15/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 25.0
    }

}
