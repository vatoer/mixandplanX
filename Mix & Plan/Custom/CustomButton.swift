//
//  CustomButton.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 18/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setTitleColor(UIColor(red: 255/255.0, green: 129/255.0, blue: 38/255.0, alpha: 100.0), for: .init())
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(red: 255/255.0, green: 129/255.0, blue: 38/255.0, alpha: 100.0).cgColor
        self.layer.borderWidth = 3.5
        self.layer.cornerRadius = 25.0
        
    }

}
