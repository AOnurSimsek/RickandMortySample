//
//  UIFontExtensions.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import Foundation
import UIKit

extension UIFont {
    @nonobjc class var RobotoRegular_16: UIFont {
        if let font = UIFont(name: "Roboto-Regular", size: 16) {
            return font
        } else {
            return UIFont.systemFont(ofSize: 16)
        }
    }
    
    @nonobjc class var RobotoRegular_24: UIFont {
        if let font = UIFont(name: "Roboto-Regular", size: 24) {
            return font
        } else {
            return UIFont.systemFont(ofSize: 24)
        }
    }
    
    @nonobjc class var RobotoBold_24: UIFont {
        if let font = UIFont(name: "Roboto-Bold", size: 24) {
            return font
        } else {
            return UIFont.systemFont(ofSize: 24)
        }
    }
}
