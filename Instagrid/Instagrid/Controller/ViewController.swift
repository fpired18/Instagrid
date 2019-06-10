//
//  ViewController.swift
//  Instagrid
//
//  Created by etudiant-13 on 29/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var swipeLeftToShare: UILabel!
    @IBOutlet weak var swipeUpToShare: UILabel!
    @IBOutlet weak var rectangleTop: UIButton!
    @IBOutlet weak var rectangleBottom: UIButton!
    @IBOutlet weak var twoRectangles: UIButton!
    @IBOutlet weak var rectangleNo: UIButton!
    @IBOutlet weak var viewStackView: ViewStackView!
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var up: UIImageView!
    var tag = 0
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragTopPartageImage))
        viewStackView.addGestureRecognizer(panGesture)
        viewStackView.isUserInteractionEnabled = true
    }
    // DETECTION OF THE LANDSCAPE POSITION OF THE PHONE
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            left.isHidden = false
            swipeLeftToShare.isHidden = false
            up.isHidden = true
            swipeUpToShare.isHidden = true
        } else {
            left.isHidden = true
            swipeLeftToShare.isHidden = true
            up.isHidden = false
            swipeUpToShare.isHidden = false
        }
    }
    //CHANGE THE BACKGROUND IMAGE OF THE FOUR BUTTONS AND ACTIVATES THE NUMBER OF PHOTOS VISIBLE BY viewStackView.numberView = .
    @IBAction func rectangleTopButton(_ sender: UIButton) {
        sender.pulsate()
        viewStackView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        imageInitialization(image1: #imageLiteral(resourceName: "Selected"), image2: #imageLiteral(resourceName: "Layout 2"), image3: #imageLiteral(resourceName: "Layout 3"), image4: #imageLiteral(resourceName: "Layout 4"))
        viewStackView.numberView = .topRectangle
    }
    
    @IBAction func rectangleBottomButton(_ sender: UIButton) {
        sender.flash()
        viewStackView.backgroundColor = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        imageInitialization(image1: #imageLiteral(resourceName: "Layout 1"), image2: #imageLiteral(resourceName: "Selected"), image3: #imageLiteral(resourceName: "Layout 3"), image4: #imageLiteral(resourceName: "Layout 4"))
        viewStackView.numberView = .bottomRectangle
    }
    
    @IBAction func twoRectanglesButton(_ sender: UIButton) {
        viewStackView.backgroundColor = UIColor.gray
        view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        sender.shake()
        imageInitialization(image1: #imageLiteral(resourceName: "Layout 1"), image2: #imageLiteral(resourceName: "Layout 2"), image3: #imageLiteral(resourceName: "Selected"), image4: #imageLiteral(resourceName: "Layout 4"))
        viewStackView.numberView = .twoRectangles
    }
    
    @IBAction func rectangleNoButton(_ sender: UIButton) {
        sender.flashBis()
        viewStackView.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        view.backgroundColor = UIColor.purple
        imageInitialization(image1: #imageLiteral(resourceName: "Layout 1"), image2: #imageLiteral(resourceName: "Layout 2"), image3: #imageLiteral(resourceName: "Layout 3"), image4: #imageLiteral(resourceName: "Selected"))
        viewStackView.numberView = .noRectangle
    }
    
    private func imageInitialization (image1: UIImage, image2: UIImage, image3: UIImage, image4: UIImage) {
        rectangleTop.setBackgroundImage(image1, for: UIControl.State.normal)
        rectangleBottom.setBackgroundImage(image2, for: UIControl.State.normal)
        twoRectangles.setBackgroundImage(image3, for: UIControl.State.normal)
        rectangleNo.setBackgroundImage(image4, for: UIControl.State.normal)
    }
    // CALL OF THE FUNCTION THAT I WILL SEEKS FOR THE PHOTOS
    @IBAction func tapImage1(_ sender: UIImageView) {
        tag = sender.tag
        imagePickerControllerChoice()
    }
   
    func imagePickerControllerChoice() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
         // choose an image whose type of resource is the photoLibrary
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        switch tag {
        case 1:
            viewStackView.image1?.image = image
            // CHANGE THE MOST BLUE BY THE PHOTO SELECTED IN LIBRARY
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
    
    @IBAction func tapImage2(_ sender: UIImageView) {
        
        tag = sender.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage3(_ sender: UIImageView) {
        tag = sender.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func tapImage4(_ sender: UIImageView) {
        tag = sender.tag
        imagePickerControllerChoice()
    }
    
    @IBAction func dragTopPartageImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.viewStackView)
        viewStackView.center = CGPoint(x: viewStackView.center.x + translation.x, y: viewStackView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.viewStackView)
        if UIDevice.current.orientation.isPortrait {
            // DETECT THE Y VALUE OF THE VIEW AND COMPARE IT TO THE SUPER VIEW IF THERE IS EQUAL TO ZERO THE SHARING APPLICATIONS
            if viewStackView.frame.origin.y <= view.frame.origin.y {
                shareUsingActivityVC(viewStackView)
                // REPOSITIONING THE VIEW TO THE CENTER WITH AN ANIMATION OF 4 SECONDS
                UIView.animate(withDuration: 0.4, animations: ({
                    self.viewStackView.center = self.view.center
                }))
            }
        } else {
            if viewStackView.frame.origin.x <= view.frame.origin.x {
                shareUsingActivityVC(viewStackView)
                UIView.animate(withDuration: 0.4, animations: ({
                    self.viewStackView.center = self.view.center
                }))
            }
        }
        if (sender.state == UIGestureRecognizer.State.ended) {
            UIView.animate(withDuration: 0.2, animations: ({
                self.viewStackView.center = self.view.center
            }))
        }
    }
    
    @objc func shareUsingActivityVC(_ : AnyObject) {
        // MENU OF SHARING APPLICATIONS
        UIGraphicsBeginImageContext(viewStackView.frame.size)
        viewStackView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let activityVC = UIActivityViewController.init(activityItems: [image!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
}

extension UIImage {
    
    class func combiningImage(firstImage: UIImage, secondImage: UIImage, thirdImage: UIImage, fourthImage: UIImage ) -> UIImage {
        
        let newImageWidth  = max(firstImage.size.width,  secondImage.size.width, thirdImage.size.width,  fourthImage.size.width)
        let newImageHeight = max(firstImage.size.height, secondImage.size.height, thirdImage.size.height,  fourthImage.size.height)
        let newImageSize = CGSize(width : newImageWidth, height: newImageHeight)
        
        UIGraphicsBeginImageContextWithOptions(newImageSize, false, UIScreen.main.scale)
        
        let firstImageDrawX  = round((newImageSize.width  - firstImage.size.width  ) / 2)
        let firstImageDrawY  = round((newImageSize.height - firstImage.size.height ) / 2)
        
        let secondImageDrawX = round((newImageSize.width  - secondImage.size.width ) / 2)
        let secondImageDrawY = round((newImageSize.height - secondImage.size.height) / 2)
        
        let thirdImageDrawX  = round((newImageSize.width  - thirdImage.size.width  ) / 2)
        let thirdImageDrawY  = round((newImageSize.height - thirdImage.size.height ) / 2)
        
        let fourthImageDrawX = round((newImageSize.width  - fourthImage.size.width ) / 2)
        let fourthImageDrawY = round((newImageSize.height - fourthImage.size.height) / 2)
        
        firstImage.draw(at: CGPoint(x: firstImageDrawX,  y: firstImageDrawY))
        secondImage.draw(at: CGPoint(x: secondImageDrawX, y: secondImageDrawY))
        thirdImage.draw(at: CGPoint(x: thirdImageDrawX,  y: thirdImageDrawY))
        fourthImage.draw(at: CGPoint(x: fourthImageDrawX, y: fourthImageDrawY))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        return image!
        
    }
    
}
