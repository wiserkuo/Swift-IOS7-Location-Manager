//
//  ViewController.swift
//  IOS7 Loction Manager
//
//  Created by wiserkuo on 2015/5/3.
//  Copyright (c) 2015年 wiserkuo. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController , CLLocationManagerDelegate{
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    var location: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        location = CLLocationManager()
        location.delegate=self
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
        location.startUpdatingLocation()
        //println("start updating location")
    }

    func locationManager(location:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        println("locations = \(locations)")
        mapView.camera = GMSCameraPosition(target: locations.first!.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        location.stopUpdatingLocation()
        
        println("stop updating location")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

