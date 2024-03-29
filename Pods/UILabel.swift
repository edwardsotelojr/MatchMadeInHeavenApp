//
//  UILabel.swift
//  Pods-MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 7/13/19.
//

import UIKit

extension UILabel {
    var optimalHeight: CGFloat {
        get{
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.lineBreakMode = .byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
    }
}
