//
//  ViewController.swift
//  Instagrid
//
//  Created by etudiant-13 on 29/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rectangleDessus: UIButton!
    @IBOutlet weak var deuxCarresDessus: UIButton!
    @IBOutlet weak var quatreCarres: UIButton!
    @IBOutlet weak var imageContainer: ViewStackView!
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    
    @IBOutlet weak var pictureValidation1: UIImageView!
    @IBOutlet weak var pictureValidation2: UIImageView!
    @IBOutlet weak var pictureValidation3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    @IBAction func rectangleAbove(_ sender: Any) {
        
        imageContainer.image1?.isHidden = true
        imageContainer.image3?.isHidden = false
        pictureValidation1.isHidden = false
        pictureValidation2.isHidden = true
        pictureValidation3.isHidden = true
    }
    
    @IBAction func twoSqaresAbove(_ sender: Any) {
        imageContainer.image1?.isHidden = false
        imageContainer.image3?.isHidden = true
        pictureValidation1.isHidden = true
        pictureValidation2.isHidden = false
        pictureValidation3.isHidden = true
    }
    

    @IBAction func fourSqares(_ sender: Any) {
        imageContainer.image1?.isHidden = false
        imageContainer.image3?.isHidden = false
        pictureValidation1.isHidden = true
        pictureValidation2.isHidden = true
        pictureValidation3.isHidden = false
    }
}

