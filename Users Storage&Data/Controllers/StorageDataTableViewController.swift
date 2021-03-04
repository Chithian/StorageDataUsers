//
//  StorageDataTableViewController.swift
//  Users Storage&Data
//
//  Created by Chithian on 3/3/21.
//

import UIKit


class CustomCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var storageLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
}

class StorageDataTableViewController: UITableViewController {
    
    
    let header = ["Usage", "Chats"]
//    let data = [["Total"],
//        [
//         "An Chhunny",
//         "Bun Bopha",
//         "Chy Chanthol",
//         "Dom Kosal",
//         "Eung Bunna",
//         "Hang Somavatey",
//         "Hun SreyPich",
//         "Vann Bun",
//         "Vey Landy",
//         "Chy Chanthol",
//         "Vann Bun",
//         "Vey Landy",
//         "Chy Chanthol",
//         "Chy Chanthol"
//        ]
//
//    ]
    var labelData = ["Australia", "Brazil", "Canada","China","Germany","India","Malaysia", "Pakistan", "Russia", "South Africa", "United States of America"]
    
    var imageData = ["User1", "User2", "User3"]
    
    var selectedCell: String?
    
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
        return labelData.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < header.count {
            return header[section]
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cells:CustomCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CustomCell
//
//        cells.nameLabel.text = self.labelData[indexPath.row]
//        cells.userImage?.image = UIImage(named: self.imageData[indexPath.row])
////
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCell, for: indexPath as IndexPath) as! DataTableViewCell
        cell.userImage.image = UIImage(named: imageData[indexPath.row])

        cell.nameLabel?.text = labelData[indexPath.row]

        return cell
    }

}
