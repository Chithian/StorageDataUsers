//
//  ProfileTableViewController.swift
//  Users Storage&Data
//
//  Created by Chithian on 4/3/21.
//

import UIKit


class ProfileTableViewController: UITableViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let header = ["Usage"]
    let data:[[String]] = [["Total"]]
    let image = ["image1", "image2", "image3", "image4", "image5", "image2"]
    var selectedUser: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User Name"
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        title = selectedUser
        super.viewWillAppear(animated)
        

//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 115, height: 115)
//        collectionView.collectionViewLayout = layout

        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        collectionView.dataSource = self

    }

    
    // MARK: - TableView DataSource

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
        return header[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellTotal, for: indexPath)

        cell.textLabel?.text = data[indexPath.section][indexPath.row]

        return cell
    }


}

//MARK: - Collection View DataSource

extension ProfileTableViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        cell.configure(with: UIImage(named: image[indexPath.row])!)
       
        
        return cell
    }
    
}

//MARK: - CollectionView Delegate FlowLayout

//extension ProfileTableViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//         return CGSize(width: 115, height: 115)
//    }
//}


