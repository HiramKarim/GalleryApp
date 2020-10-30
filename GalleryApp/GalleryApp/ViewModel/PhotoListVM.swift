//
//  PhotoListVM.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/29/20.
//

import Foundation

class PhotoListVM {
    var photoVM:[PhotoVM]
    
    init() {
        photoVM = [PhotoVM]()
    }
    
    func getPhotoVM(at index:Int) -> PhotoVM? {
        return photoVM.indices.contains(index) != false ? photoVM[index] : nil
    }
}

struct PhotoVM {
    let photo:Photo?
    
    var id:Int {
        return self.photo?.id ?? 0
    }
    
    var name:String {
        return self.photo?.name ?? ""
    }
    
    var description:String {
        return self.photo?.description ?? ""
    }
    
    var createdAt:String {
        return self.photo?.createdAt ?? ""
    }
    
    var imageUrl:String {
        return self.photo?.imageUrl ?? ""
    }
    
    var forSale:Bool {
        return self.photo?.forSale ?? false
    }
    
    var camera:String {
        return self.photo?.camera ?? ""
    }
}
