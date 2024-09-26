//
//  ViewController.swift
//  Weather App
//
//  Created by Bthloo on 25/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - link components
    
    @IBOutlet weak var cityNameTF:
    UITextField!
    
    
    @IBOutlet weak var validatorLBL: UILabel!
    
    @IBAction func searchBTN(_ sender: UIButton) {
       
        navigateChecker()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground(to: self.view)
        validatorLBL.text = ""
       // navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.isHidden = true
    
        //navigationItem.title = "Search by city name"
        
    }
    
    func applyGradientBackground(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        
        // Define the gradient's frame as the size of the view
        gradientLayer.frame = view.bounds
        
        // Set the gradient colors (white to blue)
        let colors = [  #colorLiteral(red: 0.0271027524, green: 0.1688991727, blue: 0.3949258207, alpha: 1).cgColor,#colorLiteral(red: 0.06393710209, green: 0.3405889868, blue: 0.6596827652, alpha: 1).cgColor,]
        gradientLayer.colors = colors
        
        // Define the start and end points for the gradient
        // (0,0) is the top-left and (1,1) is the bottom-right
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0) // Top-left corner
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1) // Bottom-right corner
        
        // Add the gradient layer to the view
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    
    
    func navigateChecker(){
        
        if let cityName = cityNameTF.text, !cityName.isEmpty, cityName.count >= 4 {
          
            let weatherScreenVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherScreen") as! HomeScreenVC
           weatherScreenVC.searchTitle = cityNameTF.text
               navigationController?.pushViewController(weatherScreenVC, animated: true)
            
        } else {
            validatorLBL.text = "Please a valid city name"
        }
    }
    

}

