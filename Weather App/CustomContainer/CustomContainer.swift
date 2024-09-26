//
//  CustomContainer.swift
//  Weather App
//
//  Created by Bthloo on 25/09/2024.
//

import UIKit

@IBDesignable
final class CustomContainer: UIView {

   
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var leftLBL: UILabel!
    
    @IBOutlet weak var rightLBL: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    
    private func configureView() {
            guard let view = self.loadViewFromNib(nibName: "CustomContainer") else { return }
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius = 25
        // Allow resizing
            self.addSubview(view) // Add loaded view as a subview
        }
    
}
