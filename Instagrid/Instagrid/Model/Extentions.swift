//
//  Extentions.swift
//  Instagrid
//
//  Created by Frédéric PICHOT on 08/05/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

// ce projet n'ayant pas de modèle réellement j'ai isolé cette extension qui procède à la logique de répartition des images
// d'où la présence d'UIKit inhabituel dans la section model
//import UIKit

//extension UIImage {
//    
//    class func combiningImage(firstImage: UIImage, secondImage: UIImage, threeImage: UIImage, forImage: UIImage ) -> UIImage {
//        
//        let newImageWidth  = max(firstImage.size.width,  secondImage.size.width, threeImage.size.width,  forImage.size.width)
//        let newImageHeight = max(firstImage.size.height, secondImage.size.height, threeImage.size.width,  forImage.size.width)
//        let newImageSize = CGSize(width : newImageWidth, height: newImageHeight)
//        
//        UIGraphicsBeginImageContextWithOptions(newImageSize, false, UIScreen.main.scale)
//        
//        let firstImageDrawX  = round((newImageSize.width  - firstImage.size.width  ) / 2)
//        let firstImageDrawY  = round((newImageSize.height - firstImage.size.height ) / 2)
//        
//        let secondImageDrawX = round((newImageSize.width  - secondImage.size.width ) / 2)
//        let secondImageDrawY = round((newImageSize.height - secondImage.size.height) / 2)
//        
//        let threeImageDrawX  = round((newImageSize.width  - firstImage.size.width  ) / 2)
//        let threeImageDrawY  = round((newImageSize.height - firstImage.size.height ) / 2)
//        
//        let forImageDrawX = round((newImageSize.width  - secondImage.size.width ) / 2)
//        let forImageDrawY = round((newImageSize.height - secondImage.size.height) / 2)
//        
//        firstImage.draw(at: CGPoint(x: firstImageDrawX,  y: firstImageDrawY))
//        secondImage.draw(at: CGPoint(x: secondImageDrawX, y: secondImageDrawY))
//        threeImage.draw(at: CGPoint(x: threeImageDrawX,  y: threeImageDrawY))
//        forImage.draw(at: CGPoint(x: forImageDrawX, y: forImageDrawY))
//        
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//        
//        
//        return image!
//        
//    }
//    
//}
