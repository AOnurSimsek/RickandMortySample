//
//  Protocols.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 15.06.2022.
//

import Foundation

protocol MainScreenDelegate {
    func dataReached()
    func errorOccured()
}

protocol FilterScreenDelegate {
    func characterChanged()
}

protocol CharacterViewDelegate: AnyObject {
    func viewSelected(selectedChar: CharacterNames)
}

