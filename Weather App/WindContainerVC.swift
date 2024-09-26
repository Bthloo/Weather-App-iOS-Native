//
//  WindContainerVC.swift
//  Weather App
//
//  Created by Bthloo on 25/09/2024.
//

import UIKit

class WindContainerVC: UIViewController {
    
    
    
    @IBOutlet weak var windSpeedLBL: UILabel!
    
    @IBOutlet weak var windDirectionLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
