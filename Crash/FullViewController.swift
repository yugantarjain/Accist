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

class ViewController: UIViewController
{
    var imageLink: String!
    var place: String!
    var time: String!
    var lati: Double!
    var longi: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var map: MKMapView!
}

