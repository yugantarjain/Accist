//
//  CrashTableViewController.swift
//  Crash
//
//  Created by yugantar jain on 17/02/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CrashTableViewController: UITableViewController {
    
    var places =  [String]()
    var timings = [String]()
    var imageLinks = [String]()
    var latis = [Double]()
    var longis = [Double]()
    
    @IBOutlet var crashTable: UITableView!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        db.collection("cases").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                    self.places.append(document.get("place") as! String)
//                    self.timings.append(document.get("time") as! Timestamp)
//                    self.imageLinks.append(document.get("image") as! String)
//                    self.xys.append(document.get("xy") as! GeoPoint)
//                }
//            }
//            self.crashTable.reloadData()
//        }
        
        ref.child("cases").observe(.childAdded, with: { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as? [String: AnyObject]
                self.imageLinks.append(a?["url"] as! String)
                self.places.append(a?["loc"] as! String)
                self.timings.append(a?["time"] as! String)
                self.latis.append(a?["lat"] as! Double)
                self.longis.append(a?["loc"] as! Double)
            }
            self.crashTable.reloadData()
        })
        
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crashCell", for: indexPath)
        cell.detailTextLabel?.text = places[indexPath.row]
        cell.textLabel?.text = timings[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath.row
        performSegue(withIdentifier: "toFull", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="toFull")
        {
            let next = segue.destination as! ViewController
            next.imageLink = imageLinks[index]
            next.place = places[index]
            next.time = timings[index]
            next.lati = latis[index]
            next.longi = longis[index]
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
