//
//  StringExtensions.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import Foundation
import UIKit

extension String {
    func getAttributedString(type: AttributeLabelType) -> NSMutableAttributedString {
        var wholeName: String = ""
        var range = NSRange()

        switch type {
        case .name:
            wholeName = "Name: " + self
            range = ((wholeName) as NSString).range(of: "Name: ")
        case .id:
            wholeName = "#id: " + self
            range = ((wholeName) as NSString).range(of: "#id: ")
        case .location:
            wholeName = "Location: " + self
            range = ((wholeName) as NSString).range(of: "Location: ")
        }
        
        let attributeString = NSMutableAttributedString(string: wholeName,
                                                        attributes: [.font: UIFont.RobotoRegular_16,
                                                                     .foregroundColor: UIColor.lightGray])
        let secondAttribute = [.foregroundColor: UIColor.black ] as [NSAttributedString.Key : Any]
        attributeString.addAttributes(secondAttribute, range: range)
        return attributeString
    }
}
