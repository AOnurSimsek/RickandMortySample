//
//  Observable.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 25.06.2022.
//

import Foundation

final class Observable<T> {
    typealias Listener = (T) -> Void

    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
