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
    var makeNewViewStackView: UIImageView?
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    
    @IBOutlet var imageValidation: [UIImageView]!
    
    var imageArray = [UIImage]()
    var indice = 0
    var tag = 0
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragTopPartageImage))
        viewStackView.isUserInteractionEnabled = true
        viewStackView.addGestureRecognizer(panGesture)
       
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
    

    @IBAction func tapImage1(_ sender: Any) {
        tag = 1
        imagePickerControllerChoice()
    }
    
    func imagePickerControllerChoice() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        switch tag {
        case 1:
            viewStackView.image1?.image = image
            viewStackView.image1?.contentMode = .scaleAspectFill
        case 2:
            viewStackView.image2?.image = image
            viewStackView.image2?.contentMode = .scaleAspectFill
        case 3:
            viewStackView.image3?.image = image
            viewStackView.image3?.contentMode = .scaleAspectFill
        case 4:
            viewStackView.image4?.image = image
            viewStackView.image4?.contentMode = .scaleAspectFill
        default:
            return
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapImage2(_ sender: Any) {
        tag = 2
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage3(_ sender: Any) {
        tag = 3
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage4(_ sender: Any) {
        tag = 4
        imagePickerControllerChoice()
    }
    
    @IBAction func dragTopPartageImage(_ sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(viewStackView)
        let translation = sender.translation(in: self.viewStackView)
        viewStackView.center = CGPoint(x: viewStackView.center.x + translation.x, y: viewStackView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.viewStackView)
        shareUsingActivityVC(viewStackView)
        
    }
    
    @IBAction func dragLeftPartageImage(_ sender: UIScreenEdgePanGestureRecognizer) {
    }
    
    func shareUsingActivityVC(_ : AnyObject) {
        let activityVC = UIActivityViewController.init(activityItems: ["www.iostutorialjunction.com", viewStackView as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.viewStackView
        self.present(activityVC, animated:  true, completion: nil)
    }
}

