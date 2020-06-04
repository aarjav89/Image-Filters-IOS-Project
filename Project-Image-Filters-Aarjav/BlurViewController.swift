//
//  BlurViewController.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 5/27/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var BlurIntensitySlider: UISlider!
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var sliderVal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Blur"
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
   
    @IBAction func sliderValueChange(_ sender: UISlider) {
        
        
        let currentValue = Int((sender.value).rounded())
        sliderVal.text = String(currentValue)
        BlurIntensitySlider.maximumValue = 10
        BlurIntensitySlider.minimumValue = 0

        let currentFilter = CIFilter(name: "CIBoxBlur")
        currentFilter!.setValue(CIImage(image: ImgView.image!), forKey: kCIInputImageKey)
        currentFilter!.setValue(currentValue, forKey: kCIInputRadiusKey)

       
        let context = CIContext(options: nil)

        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        ImgView.image = processedImage
        
    }
}
