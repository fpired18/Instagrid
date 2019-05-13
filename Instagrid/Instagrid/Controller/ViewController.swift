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
    @IBOutlet weak var twoRectangles: UIButton!
    @IBOutlet weak var rectangleNo: UIButton!
    @IBOutlet weak var viewStackView: ViewStackView!
    var makeNewViewStackView: UIImageView?
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    

    
    var tag = 0
    var panGesture = UIPanGestureRecognizer()
    var edgePan = UIScreenEdgePanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(dragLeftPartageImage))
        viewStackView.addGestureRecognizer(edgePan)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragTopPartageImage))
        viewStackView.addGestureRecognizer(panGesture)
        viewStackView.isUserInteractionEnabled = true
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape {
            left.isHidden = false
            up.isHidden = true
        } else {
            left.isHidden = true
            up.isHidden = false
        }
    }
    
    @IBAction func rectangleTopButton(_ sender: UIButton) {
        sender.pulsate()
        rectangleTop.setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        rectangleBottom.setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
        twoRectangles.setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        rectangleNo.setBackgroundImage(#imageLiteral(resourceName: "Layout 4"), for: UIControl.State.normal)
        viewStackView.numberView = .topRectangle
    }
    
    @IBAction func rectangleBottomButton(_ sender: UIButton) {
        sender.flash()
        rectangleTop.setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
        rectangleBottom.setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        twoRectangles.setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        rectangleNo.setBackgroundImage(#imageLiteral(resourceName: "Layout 4"), for: UIControl.State.normal)
        viewStackView.numberView = .bottomRectangle
    }
    
    @IBAction func twoRectanglesButton(_ sender: UIButton) {
        sender.shake()
        rectangleTop.setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
        rectangleBottom.setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
        twoRectangles.setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        rectangleNo.setBackgroundImage(#imageLiteral(resourceName: "Layout 4"), for: UIControl.State.normal)
        viewStackView.numberView = .twoRectangles
    }
    
    @IBAction func rectangleNoButton(_ sender: UIButton) {
        sender.flashBis()
        rectangleTop.setBackgroundImage(#imageLiteral(resourceName: "Layout 1"), for: UIControl.State.normal)
        rectangleBottom.setBackgroundImage(#imageLiteral(resourceName: "Layout 2"), for: UIControl.State.normal)
        twoRectangles.setBackgroundImage(#imageLiteral(resourceName: "Layout 3"), for: UIControl.State.normal)
        rectangleNo.setBackgroundImage(#imageLiteral(resourceName: "Selected"), for: UIControl.State.normal)
        viewStackView.numberView = .noRectangle
    }
    
    @IBAction func tapImage1(_ sender: Any) {
        tag = viewStackView.image1.tag
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
        tag = viewStackView.image2.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage3(_ sender: Any) {
        tag = viewStackView.image3.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage4(_ sender: Any) {
        tag = viewStackView.image4.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func dragTopPartageImage(_ sender: UIPanGestureRecognizer) {
//        print("____________________________________")
//        print("Je suis dans le dragTop")
//        print("____________________________________")
        self.view.bringSubviewToFront(viewStackView)
        let translation = sender.translation(in: self.viewStackView)
        viewStackView.center = CGPoint(x: viewStackView.center.x + translation.x, y: viewStackView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.viewStackView)
        if viewStackView.frame.origin.y <= view.frame.origin.y {
          shareUsingActivityVC(viewStackView)
        }
    }
    
    @IBAction func dragLeftPartageImage(_ sender: UIScreenEdgePanGestureRecognizer) {
//        print("____________________________________")
//        print("Je suis dans le dragLeft")
//        print("____________________________________")
        if sender.state == .recognized {
            print("Screen edge swiped !")
        }
        self.view.bringSubviewToFront(viewStackView)
        let translation = sender.translation(in: self.viewStackView)
        viewStackView.center = CGPoint(x: viewStackView.center.x + translation.x, y: viewStackView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.viewStackView)
        if viewStackView.frame.origin.x <= view.frame.origin.x {
            shareUsingActivityVC(viewStackView)
        }
    }
    
    @objc func shareUsingActivityVC(_ : AnyObject) {
        let activityVC = UIActivityViewController.init(activityItems: ["www,iostutorialjunction.com", viewStackView as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.viewStackView
        self.present(activityVC, animated:  true, completion: nil)
    }
}

