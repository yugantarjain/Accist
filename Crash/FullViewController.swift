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
        location.text = time        //location <-> time
        latit.text = String(lati)
        longit.text = String(longi)
        timet.text = place          //location <-> time
        
        //map
        let xy = CLLocationCoordinate2D(latitude: lati, longitude: longi)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        map.region = MKCoordinateRegion.init(center: xy, span: span)
    }
    @IBAction func resolve(_ sender: UIButton) {
        let alert = UIAlertController(title: "Resolved?", message: "Kindly Confirm", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .cancel, handler: { _ in
            print("alert presented")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Confirm", comment: "Default action"), style: .default, handler: { _ in
            
            ref = Database.database().reference()
            ref.child("cases").observe(.value, with: { (snapshot) in
                for data in snapshot.children.allObjects as! [DataSnapshot]
                {
                    let a = data.value as?  [String: AnyObject]
                    if(self.place==(a?["loc"] as! String))
                    {
                        
                    }
                }

            })
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBOutlet weak var image: WKWebView!
    @IBOutlet weak var resolvedButton: UIButton!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var latit: UILabel!
    @IBOutlet weak var longit: UILabel!
    @IBOutlet weak var timet: UILabel!
   
}

