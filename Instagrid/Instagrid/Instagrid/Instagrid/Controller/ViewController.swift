//
//  ViewController.swift
//  Instagrid
//
//  Created by etudiant-13 on 29/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var rectangleTop: UIButton!
    @IBOutlet weak var rectangleBottom: UIButton!
    @IBOutlet weak var rectangleNo: UIButton!
    @IBOutlet weak var viewStackView: ViewStackView!
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    
    @IBOutlet var imageValidation: [UIImageView]!
    
    var imageArray = [UIImage]()
    var indice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [#imageLiteral(resourceName: "lac_achartcimages_et_reves"), #imageLiteral(resourceName: "images"), #imageLiteral(resourceName: "ob_429b77_1330"), #imageLiteral(resourceName: "paysage-de-montagne-fleuri-pexels-photo-532324"), #imageLiteral(resourceName: "DSC1635-Panorama-Modifier-Modifier"), #imageLiteral(resourceName: "image")]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            left.isHidden = false
            up.isHidden = true
        }
        else {
            left.isHidden = true
            up.isHidden = false
        }
    }
    
    
    @IBAction func rectangleTopButton(_ sender: Any) {
        
        viewStackView.numberView = .topRectangle
        imageValidation[0].isHidden = false
        imageValidation[1].isHidden = true
        imageValidation[2].isHidden = true
    }
    
    @IBAction func rectangleBottomButton(_ sender: Any) {
        
        viewStackView.numberView = .bottomRectangle
        imageValidation[0].isHidden = true
        imageValidation[1].isHidden = false
        imageValidation[2].isHidden = true
    }
    

    @IBAction func rectangleNoBotton(_ sender: Any) {
        
        viewStackView.numberView = .noRectangle
        imageValidation[0].isHidden = true
        imageValidation[1].isHidden = true
        imageValidation[2].isHidden = false
    }
    
    @IBAction func tapButton1(_ sender: Any) {
        viewStackView.image1?.image = imageArray[indice]
        //viewStackView.rectangleTopButton1.isHidden = true
        if indice == imageArray.count-1 {
            indice = 0
        }
        else {
        indice += 1
        }
        //}
    }
    
    @IBAction func tapButton2(_ sender: Any) {
        viewStackView.image2?.image = imageArray[indice]
        //viewStackView.carreTopButton2.isHidden = true
        if indice == imageArray.count-1 {
            indice = 0
        }
        else {
            indice += 1
        }
    }
    
    @IBAction func tapButton3(_ sender: Any) {
        viewStackView.image3?.image = imageArray[indice]
        //viewStackView.rectangleTopButton3.isHidden = true
        if indice == imageArray.count-1 {
            indice = 0
        }
        else {
            indice += 1
        }
    }
    
    
    @IBAction func tapButton4(_ sender: Any) {

        viewStackView.image4?.image = imageArray[indice]
        //viewStackView.carreTopButton4.isHidden = true
        if indice == imageArray.count-1 {
            indice = 0
        }
        else {
            indice += 1
        }
    }
    
//    func scrollView() {
//        for i in 0..<imageArray.count{
//            let imageView = UIImageView()
//            imageView.image = imageArray[i]
//            imageView.contentMode = .scaleAspectFit
//            let xPosition = self.view.frame.width * CGFloat (i)
//            imageView.frame = CGRect(x: xPosition, y: 0, width: self.viewStackView.imageScrollView1.frame.width, height: self.viewStackView.imageScrollView1.frame.height)
//            viewStackView.imageScrollView1.contentSize.width = viewStackView.imageScrollView1.frame.width * CGFloat(i+1)
//            viewStackView.imageScrollView1.addSubview(imageView)
//        }
//    }
}

