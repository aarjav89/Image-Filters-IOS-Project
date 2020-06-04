//
//  InvertViewController.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 6/4/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class InvertViewController: UIViewController {
    
    let backgroundImageView = UIImageView()

    @IBOutlet weak var ImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Invert"
        setBackground()
        setInvert()

        // Do any additional setup after loading the view.
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
    
    func setInvert(){
        let filter = CIFilter(name: "CIColorInvert")
        filter!.setValue(CIImage(image: ImgView.image!), forKey: kCIInputImageKey)
        
        let context = CIContext(options:nil)
         let output = filter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
            ImgView.image = processedImage
    }

   

}
