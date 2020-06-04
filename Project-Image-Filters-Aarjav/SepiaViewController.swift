//
//  SepiaViewController.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 5/27/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class SepiaViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    
    @IBOutlet weak var SepiaIntensitySlider: UISlider!
    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var sliderVal: UILabel!
    
    var defaultImg: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sepia"
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
   
    @IBAction func sepiaSliderChanged(_ sender: UISlider) {
        let currentValue = Int((sender.value).rounded())
        sliderVal.text = String(currentValue)
        SepiaIntensitySlider.maximumValue = 10
        SepiaIntensitySlider.minimumValue = 0
        
        
        
        let currentFilter = CIFilter(name: "CISepiaTone")
         currentFilter!.setValue(CIImage(image: ImgView.image!), forKey: kCIInputImageKey)
         currentFilter!.setValue(currentValue, forKey: kCIInputIntensityKey)

        
         let context = CIContext(options: nil)

         let output = currentFilter!.outputImage
         let cgimg = context.createCGImage(output!, from: output!.extent)
         let processedImage = UIImage(cgImage: cgimg!)
         ImgView.image = processedImage
          
    }
    
    @IBAction func Reset_clicked(_ sender: UIButton) {
        var rawImg = CIImage(image: defaultImg!)
        ImgView.image = UIImage(ciImage: rawImg!)
    }
}
