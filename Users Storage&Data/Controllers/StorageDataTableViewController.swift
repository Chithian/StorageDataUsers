//
//  StorageDataTableViewController.swift
//  Users Storage&Data
//
//  Created by Chithian on 3/3/21.
//

import UIKit

class StorageDataTableViewController: UITableViewController {
    
    
    let header = ["Usage", "Chats"]
    let data = [["Total"],
        [
         "An Chhunny",
         "Bun Bopha",
         "Chy Chanthol",
         "Dom Kosal",
         "Eung Bunna",
         "Hang Somavatey",
         "Hun SreyPich",
         "Vann Bun",
         "Vey Landy",
         "Chy Chanthol",
         "Vann Bun",
         "Vey Landy",
         "Chy Chanthol"
        ]
 
    ]
//    let userImage = ["User1", "User2"]
    
//    var selectedCell: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Storage and Data"
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.ProfileSegue, sender: self)
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
