//
//  ViewStackView.swift
//  Instagrid
//
//  Created by Frédéric PICHOT on 29/04/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import UIKit

class ViewStackView: UIView {
    @IBOutlet public var image1: UIImageView!
    @IBOutlet public var image2: UIImageView!
    @IBOutlet public var image3: UIImageView!
    @IBOutlet public var image4: UIImageView!
    @IBOutlet public var view1: UIView?
    @IBOutlet public var view3: UIView?
    
    enum NumberView {
        case topRectangle, bottomRectangle, twoRectangles, noRectangle
    }
    
    var numberView: NumberView = .noRectangle {
        didSet {
            setNumberView(numberView)
        }
    }
    
    private func setNumberView ( _ numberView: NumberView) {
        UIView.animate(withDuration: 1.0, animations: ({
            switch numberView {
            case .topRectangle:
                self.image1.isHidden = true
                self.view1?.isHidden = true
                self.image3?.isHidden = false
                self.view3?.isHidden = false
            case .bottomRectangle:
                self.view1?.isHidden = false
                self.image1.isHidden = false
                self.image3?.isHidden = true
                self.view3?.isHidden = true
            case .twoRectangles:
                self.image1.isHidden = true
                self.view1?.isHidden = true
                self.image3?.isHidden = true
                self.view3?.isHidden = true
            case .noRectangle:
                self.view1?.isHidden = false
                self.image1.isHidden = false
                self.image3?.isHidden = false
                self.view3?.isHidden = false
            }
        }))
    }
}
