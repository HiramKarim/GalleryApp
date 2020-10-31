//
//  PhotoListVM.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/29/20.
//

import Foundation

class PhotoListVM {
    var photoVM:[PhotoVM]
    var errorMessage = ""
    
    init() {
        photoVM = [PhotoVM]()
    }
    
    init(photos:[PhotoVM]) {
        photoVM = photos
    }
    
    func getPhotoVM(at index:Int) -> PhotoVM? {
        return photoVM.indices.contains(index) != false ? photoVM[index] : nil
    }
}

extension PhotoListVM {
    func fetchPhotos(completion: @escaping (Bool) -> Void) {
        WebService.shared().load(resource: Photo.allPhotos, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(false)
                break
            case .success(let photos):
                self.photoVM = photos.photos?.map(PhotoVM.init) ?? []
                completion(true)
                break
            }
        })
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
    
//    var imageUrl:String {
//        return self.photo?.imageUrl ?? ""
//    }
//    
//    var forSale:Bool {
//        return self.photo?.forSale ?? false
//    }
//    
//    var camera:String {
//        return self.photo?.camera ?? ""
//    }
}
