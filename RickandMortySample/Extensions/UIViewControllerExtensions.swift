//
//  UIViewControllerExtensions.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 15.06.2022.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIViewController {
    //MARK: - Indicator
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    //MARK: - Alert
    func showError() {
        let alertViewController = UIAlertController(title: "Error", message: "And error occured. Please try again later", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true)
    }
}

