//
//  Enums.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import Foundation

enum AttributeLabelType {
    case name
    case id
    case location
}

enum CharacterNames: CustomStringConvertible {
    case rick
    case morty
    case both
    
    var description : String {
        switch self {
        case .rick:
            return "rick"
        case .morty:
            return "morty"
        case .both:
            return ""
        }
    }
}
