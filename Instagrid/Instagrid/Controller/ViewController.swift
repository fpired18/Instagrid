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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func rectangleAbove(_ sender: Any) {
        
        imageContainer.image1?.isHidden = true
        imageContainer.image2?.isHidden = false
        imageContainer.image3?.isHidden = false
        imageContainer.image4?.isHidden = false
    }
    
    @IBAction func twoSqaresAbove(_ sender: Any) {
        imageContainer.image1?.isHidden = false
        imageContainer.image2?.isHidden = false
        imageContainer.image3?.isHidden = true
        imageContainer.image4?.isHidden = false
    }
    

    @IBAction func fourSqares(_ sender: Any) {
        imageContainer.image1?.isHidden = false
        imageContainer.image2?.isHidden = false
        imageContainer.image3?.isHidden = false
        imageContainer.image4?.isHidden = false
    }
}

