//
//  ViewController.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 5/26/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   let backgroundImageView = UIImageView()

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var EffectRadius: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Image Filters"
        setBackground()
    }
    
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "blue1")
        view.sendSubviewToBack(backgroundImageView)
    }

}

