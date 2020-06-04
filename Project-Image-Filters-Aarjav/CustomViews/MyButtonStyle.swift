//
//  MyButtonStyle.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 5/26/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class MyButtonStyle: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        setShadow()
        backgroundColor     = UIColor.init(displayP3Red: 0, green: 0, blue: 255, alpha: 0.6)
        titleLabel?.font    = UIFont(name: "AvenirNext-DemiBold", size: 20)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
