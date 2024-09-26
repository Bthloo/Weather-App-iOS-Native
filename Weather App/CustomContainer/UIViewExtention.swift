//
//  UIViewExtention.swift
//  Weather App
//
//  Created by Bthloo on 25/09/2024.
//

import UIKit
extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
       return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
