//
//  MainPageViewController.swift
//  Crash
//
//  Created by yugantar jain on 17/02/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MainPageViewController: UIViewController {
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        mainButton.titleLabel?.numberOfLines = 0
        mainButton.titleLabel?.textAlignment = .center
        mainButton.isEnabled = false
        
        db.collection("cases").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.mainButton.isEnabled = true
                    self.view.backgroundColor = UIColor.red
                    break;
                }
            }
        }
    }
    @IBOutlet weak var mainButton: UIButton!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
