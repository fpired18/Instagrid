//
//  Extentions.swift
//  Instagrid
//
//  Created by Frédéric PICHOT on 08/05/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

extension UIImage {
    
    func makeImage(_ value : CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
    
}
