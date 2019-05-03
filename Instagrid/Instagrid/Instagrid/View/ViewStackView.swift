//
//  ViewStackView.swift
//  Instagrid
//
//  Created by Frédéric PICHOT on 29/04/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

class ViewStackView: UIView {
    @IBOutlet public var image1: UIImageView?
    @IBOutlet public var image2: UIImageView?
    @IBOutlet public var image3: UIImageView?
    @IBOutlet public var image4: UIImageView?
    
    enum NumberView {
        case topRectangle, bottomRectangle, noRectangle
    }
    
    var numberView: NumberView = .noRectangle {
        didSet {
            setNumberView(numberView)
        }
    }
    
    private func setNumberView ( _ numberView: NumberView) {
        switch numberView {
        case .topRectangle:
            image1?.isHidden = true
            image3?.isHidden = false
        case .bottomRectangle:
            image1?.isHidden = false
            image3?.isHidden = true
        case .noRectangle:
            image1?.isHidden = false
            image3?.isHidden = false
        }
    }

}
