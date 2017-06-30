//
//  ViewController.swift
//  MyApp15
//
//  Created by iii-user on 2017/6/30.
//  Copyright © 2017年 iii-user. All rights reserved.
//

//1.info.plist => 權限
//2.User => Permission



import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    
    
    let lmgr = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            let lat = loc.coordinate.latitude
            let lng = loc.coordinate.longitude
            let h = loc.altitude
            print("\(lat),\(lng) = \(h)")
            webView.stringByEvaluatingJavaScript(from: "moveToKD(\(lat),\(lng))")
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "map", withExtension: "html")
        let req = URLRequest(url:url!)
        webView.loadRequest(req)
        
        lmgr.requestAlwaysAuthorization()
        lmgr.delegate = self
        lmgr.startUpdatingLocation()
        
    }

   


}

