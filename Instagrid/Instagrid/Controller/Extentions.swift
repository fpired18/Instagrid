//
//  Extentions.swift
//  Instagrid
//
//  Created by Frédéric PICHOT on 08/05/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

extension UIImage {
    
    func makeImage() -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: 1)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
    
}
