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
    let detail = [
        "100 MB",
        "50 MB",
        "30 MB",
        "20 MB",
        "30 MB",
        "50 MB",
        "30 MB",
        "20 MB",
        "50 MB",
        "20 MB",
        "30 MB",
        "20 MB",
        "50 MB"
    ]
    
    let userImage = ["User1", "User2", "User1", "User1", "User2", "User2", "User1", "User2", "User2", "User1", "User2", "User2", "User1"]
    
    var selectedCell: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Storage and Data"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedCell
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped!")
        performSegue(withIdentifier: Constants.ProfileSegue, sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ProfileTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedUser = data[indexPath.section][indexPath.row]
        }
    }
    

    // MARK: - Table view Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section < header.count {
//            return header[section]
//        }
//        return nil
//        if section == 1 {
//            let searchButton = UIButton()
//        
//
//        }
        return header[section]
    }
    
    //Button Search Action
    @objc func buttonAction(sender: UIButton!) {
      print("Button Search")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellTotal, for: indexPath)
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
            
            cell.isUserInteractionEnabled = false
                print("Can't selected")
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellUser, for: indexPath)
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
            cell.detailTextLabel?.text = detail[indexPath.row]
            
            let imageUser = UIImage(named: userImage[indexPath.row])
            cell.imageView?.image = imageUser
                print("Can selected")
            
            
            // Add Search button to header section
            let button = UIButton(frame: CGRect(x: 375, y: 135, width: 30, height: 20))
            button.tintColor = UIColor.gray
            
            if #available(iOS 13.0, *) {
                button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
           
            button.setTitleColor(.lightGray, for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
              self.view.addSubview(button)
            
            return cell
        }
       

    }

}
