//
//  CommerceTableViewController.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 4/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit
import Haneke


class CommerceTableViewController: UITableViewController {
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commerceArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommerceTableViewCell
        cell.nameLabel.text = commerceArray[indexPath.row].address
        cell.cityLabel.text = commerceArray[indexPath.row].city
        
        let logoURL = commerceArray[indexPath.row].logoURL
        let URL = NSURL(string:logoURL)!
        cell.logoImageView!.clipsToBounds = true
        cell.logoImageView!.contentMode = .scaleAspectFill
        cell.logoImageView!.hnk_setImageFromURL(URL as URL)
        
        let photoURL = commerceArray[indexPath.row].photoURL
        print(photoURL)
        let galleryURL = NSURL(string:photoURL)!
        cell.galleryImageView!.clipsToBounds = true
        cell.galleryImageView!.contentMode = .scaleAspectFill
        cell.galleryImageView!.hnk_setImageFromURL(galleryURL as URL)

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: tableView)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let commerceViewController = segue.destination as! CommerceDetailViewController
        let indexPath = self.tableView.indexPathForSelectedRow!
        let row = indexPath.row
        commerceViewController.commerce = commerceArray[row]
    }
    


}
