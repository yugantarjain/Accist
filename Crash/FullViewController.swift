//
//  ViewController.swift
//  Crash
//
//  Created by yugantar jain on 17/02/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map.isZoomEnabled = true
//        map.centerCoordinate.latitude = 28
//        map.centerCoordinate.longitude = 77
        let centreCoord = CLLocationCoordinate2D(latitude: 28, longitude: 77)
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        map.region = MKCoordinateRegion(center: centreCoord, span: span)
       
        
        
    }

    @IBOutlet weak var map: MKMapView!
}

