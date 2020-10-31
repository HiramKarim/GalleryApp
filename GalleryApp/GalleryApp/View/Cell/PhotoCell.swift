//
//  PhotoCell.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/30/20.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    static var nib  : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
     return String(describing: self)
    }
    
    var photoVM: PhotoVM? {
        didSet {
            NameLabel.text = photoVM?.name ?? ""
            DescriptionLabel.text = photoVM?.description ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
