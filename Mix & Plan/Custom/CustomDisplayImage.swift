//
//  CustomDisplayImage.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 18/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class CustomDisplayImage: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 15.0
    }
}
