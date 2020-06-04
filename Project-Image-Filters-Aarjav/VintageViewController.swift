//
//  VintageViewController.swift
//  Project-Image-Filters-Aarjav
//
//  Created by Aarjav on 6/2/20.
//  Copyright © 2020 Aarjav. All rights reserved.
//

import UIKit

class VintageViewController: UIViewController {

    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var ImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vintage"
            setBackground()
            setVintage()

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
        
        func setVintage(){
            let filter = CIFilter(name: "CIPhotoEffectProcess")
            filter!.setValue(CIImage(image: ImgView.image!), forKey: kCIInputImageKey)
            
            let context = CIContext(options:nil)
             let output = filter!.outputImage
            let cgimg = context.createCGImage(output!, from: output!.extent)
            let processedImage = UIImage(cgImage: cgimg!)
                ImgView.image = processedImage
        }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
