//
//  ProfileTableViewController.swift
//  Users Storage&Data
//
//  Created by Chithian on 4/3/21.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    
    let header = ["Usage"]
    let data:[[String]] = [["Total"]]
    
    var selectedUser: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User Name"
        
//        self.navigationItem.setHidesBackButton(true, animated: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedUser
        super.viewWillAppear(animated)


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return header.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section < header.count {
//            return header[section]
//        }
//        return nil
        return header[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        


//        cells.userImage?.image = UIImage(named: self.imageData[indexPath.row])
////
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCell, for: indexPath)
//        cell.userImage.image = UIImage(named: imageData[indexPath.row])

        cell.textLabel?.text = data[indexPath.section][indexPath.row]
//        cell.imageView?.image = UIImage(named: self.userImage[indexPath.row])
        return cell
    }


}
