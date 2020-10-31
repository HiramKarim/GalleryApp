//
//  PhotoListTVC.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/29/20.
//

import UIKit

class PhotoListTVC: UITableViewController {
    
    private var photoListVM = PhotoListVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.title = "Galley"
        
        self.tableView.register(PhotoCell.nib, forCellReuseIdentifier: PhotoCell.identifier)
        //self.tableView.rowHeight = 80
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        
        fetchPhotos()
    }
    
    private func fetchPhotos() {
        photoListVM.fetchPhotos { [weak self] (result) in
            guard let self = self else { return }
            if result {
                DispatchQueue.main.async { self.tableView.reloadData() }
            } else {
                self.showAlert()
            }
        }
    }
    
    /*
    private func bindVM(using photos:PhotoData) {
        photoListVM.photoVM = photos.photos?.map(PhotoVM.init) ?? []
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    */
    
    private func showAlert() {
        let alert = UIAlertController(title: "", message: photoListVM.errorMessage, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photoListVM.photoVM.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoCell
        else { return UITableViewCell() }
        
        cell.photoVM = photoListVM.getPhotoVM(at: indexPath.row)
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
