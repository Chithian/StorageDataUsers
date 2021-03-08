//
//  ViewController.swift
//  Users Storage&Data
//
//  Created by Chithian on 3/3/21.
//

import UIKit


class ViewController: UIViewController {
  
    
    @IBOutlet var tableView: UITableView!
    
    
    let data:[[String]] = [["Manage Storage"], ["Photos", "Videos", "Files"]]
    let header = [
        "Storage",
        "Auto Download"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.title = "Storage and Data"
        
        
        //Remove Navifation bar & background
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()

    }
    
    // Navigation(remove Back keep only the icon )
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


//MARK: - Table View Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.StorageDataSegue, sender: self)
        print("Tapped")
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! StorageDataTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedCell = data[indexPath.section][indexPath.row]
        }
        
    }
}

//MARK: - Table View DataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < header.count {
            return header[section]
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCell, for: indexPath)
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellWifi, for: indexPath)
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
            
            return cell
            
        }
        
    }
    
}
 




