//
//  MainViewController.swift
//  Foodie
//
//  Created by Apple on 10.08.2022.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    private var userLocation: CLLocation?
    private var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        findUserLocation()
    }

    @IBAction func didTapRestaurantAroundMeAction(_ sender: UIButton) {
        
    }
    
    private func findUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        
        print(locationManager?.authorizationStatus.rawValue as Any)
        
        if  locationManager?.authorizationStatus == .authorizedAlways ||
                locationManager?.authorizationStatus == .authorizedWhenInUse {
            locationManager?.startUpdatingLocation()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToRestaurant" {
            let destination = segue.destination as! RestaurantViewController
            destination.userLocation = userLocation
        }
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        
        userLocation = lastLocation
        
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
