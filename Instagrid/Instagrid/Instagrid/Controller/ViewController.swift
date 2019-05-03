//
//  ViewController.swift
//  Instagrid
//
//  Created by etudiant-13 on 29/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rectangleTop: UIButton!
    @IBOutlet weak var rectangleBottom: UIButton!
    @IBOutlet weak var rectangleNo: UIButton!
    @IBOutlet weak var viewStackView: ViewStackView!
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    
    @IBOutlet var imageValidation: [UIImageView]!
    
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
}

