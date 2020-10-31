//
//  Photo.swift
//  GalleryApp
//
//  Created by Hiram Castro on 10/29/20.
//

import Foundation

struct PhotoData:Codable {
    let currentPage:Int?
    let photos:[Photo]?
    
    private enum CodingKeys : String, CodingKey {
        case currentPage = "current_page"
        case photos
    }
}

struct Photo:Codable {
    let id:Int?
    let name:String?
    let description:String?
    let createdAt:String?
    //let imageUrl:String?
    //let forSale:Bool?
    //let camera:String?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case createdAt = "created_at"
        //case imageUrl = "image_url"
        //case forSale = "for_sale"
        //case camera
    }
}

extension Photo {
    static var allPhotos:Resource<PhotoData> = {
        guard let url = URL(string: API.allPhotosURL) else { fatalError("URL is incorrect!") }
        return Resource<PhotoData>(url: url)
    }()
}
