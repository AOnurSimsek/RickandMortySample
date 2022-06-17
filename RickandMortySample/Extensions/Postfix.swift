//
//  Postfix.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 14.06.2022.
//

import Foundation

postfix operator ~

postfix func ~ (_ val: Int?) -> Int {
    return val ?? -1
}

postfix func ~ (_ val: String?) -> String {
    return val ?? ""
}
