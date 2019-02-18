//
//  ViewController.swift
//  Crash
//
//  Created by yugantar jain on 17/02/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import WebKit

class ViewController: UIViewController, WKUIDelegate
{
    var imageLink: String!
    var place: String!
    var time: String!
    var lati: Double!
    var longi: Double!
    let space = "   "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resolvedButton.layer.cornerRadius = 5
        
        //image load
        let myURL = URL(string: self.imageLink)
        let myRequest = URLRequest(url: myURL!)
        image.load(myRequest)
        
        //place, lati, longi, time
        location.text = place
        latit.text = String(lati)
        longit.text = String(longi)
        timet.text = time
        
        //map
        let xy = CLLocation(latitude: lati, longitude: longi)
        

        
    }

    @IBOutlet weak var image: WKWebView!
    @IBOutlet weak var resolvedButton: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var latit: UILabel!
    @IBOutlet weak var longit: UILabel!
    @IBOutlet weak var timet: UILabel!
    
    
    
    
    
    
}

