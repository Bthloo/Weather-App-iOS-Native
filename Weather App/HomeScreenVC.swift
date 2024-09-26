//
//  HomeScreenVC.swift
//  Weather App
//
//  Created by Bthloo on 25/09/2024.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    
    var weather : Weather?
    var activityIndicator: UIActivityIndicatorView!
    var errorLBL : UILabel!
    var searchTitle : String!
    
    //MARK: - conect items

   
    @IBOutlet weak var cityName: UILabel!
    
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var windContainer: CustomContainer!
    
    @IBOutlet weak var pressureContainer: CustomContainer!
    
    
    @IBOutlet weak var rainContainer: CustomContainer!
    
    
    @IBOutlet weak var tempretureLBL: UILabel!
    
    @IBOutlet weak var statusLBL: UILabel!
    

    @IBOutlet weak var cLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.0271027524, green: 0.1688991727, blue: 0.3949258207, alpha: 1)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = false
       
    
        applyGradientBackground(to: self.view)
        
        windContainer.lbl.text = "Wind"
        pressureContainer.lbl.text = "Pressure"
        
        rainContainer.lbl.text = "Rain"
        ApiManager.sharedService.delegate = self
        setupErrorLabel()
        setupActivityIndicator()
        clearView()
        
        
        //apiManager.delegate = self
        getData()
        
        
        
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
    
    
    func getData(){
       
        ApiManager.sharedService.getWeatherData(cityName: searchTitle) { (weather, error) in
            guard let weather = weather else{return}
            self.weather = weather
        }
    }
    
    
    func applyGradientBackground(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        let colors = [  #colorLiteral(red: 0.0271027524, green: 0.1688991727, blue: 0.3949258207, alpha: 1).cgColor,#colorLiteral(red: 0.06393710209, green: 0.3405889868, blue: 0.6596827652, alpha: 1).cgColor,]
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func clearView(){
        windContainer.isHidden = true
        pressureContainer.isHidden = true
        rainContainer.isHidden = true
        countryName.isHidden = true
        cityName.isHidden = true
        date.isHidden = true
        tempretureLBL.isHidden = true
        statusLBL.isHidden = true
        cLBL.isHidden = true
        errorLBL.isHidden = true
    }
    
    func showView(){
        windContainer.isHidden = false
        pressureContainer.isHidden = false
        rainContainer.isHidden = false
        countryName.isHidden = false
        cityName.isHidden = false
        date.isHidden = false
        tempretureLBL.isHidden = false
        statusLBL.isHidden = false
        cLBL.isHidden = false
        errorLBL.isHidden = false
    }
    
    
    
    func setupActivityIndicator() {
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
            self.view.addSubview(activityIndicator)
        }
    
    func setupErrorLabel(){
        errorLBL = UILabel()
        errorLBL.textColor = .white
         // errorLBL.text = errorMSG
        errorLBL.textAlignment = .center
            errorLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 50) // Set a frame with width and height
        errorLBL.numberOfLines = 0
        errorLBL.lineBreakMode = .byWordWrapping 
            errorLBL.center = self.view.center // Positio
        self.view.addSubview(errorLBL)
    }

}


extension HomeScreenVC : WeatherAppDelegate{
    func didFetchData(weather: Weather) {
        debugPrint("Success")
       
        DispatchQueue.main.async {
        
            self.activityIndicator.stopAnimating()
            self.cityName.text = weather.location.name
            self.countryName.text = weather.location.country
            self.date.text = weather.location.localtime
            self.windContainer.leftLBL.text = "Speed : \(weather.current.windKph) KPH"
            self.windContainer.rightLBL.text = "Direction : \(weather.current.windDir)"
            self.tempretureLBL.text =  String(weather.current.tempC)
            self.statusLBL.text = weather.current.condition.text
            
            self.pressureContainer.leftLBL.text = "\(weather.current.pressureIn) in"
            self.pressureContainer.rightLBL.text = "\(weather.current.pressureMB) mb"
            self.rainContainer.leftLBL.text = "\(weather.current.precipIn) in"
            self.rainContainer.rightLBL.text = "\(weather.current.precipMm) mm"
            self.showView()
        }
    }
    
    func didFail(error: (any Error)?) {
        debugPrint("Error")
        debugPrint("\(String(describing: error?.localizedDescription))")
        DispatchQueue.main.async{
            self.activityIndicator.stopAnimating()
            self.errorLBL.text = error?.localizedDescription
            self.errorLBL.isHidden = false
        }
       
    }
    
    func loading() {
        debugPrint("loading")
        DispatchQueue.main.async{
            self.activityIndicator.startAnimating()
        }
    }
    
    
}
