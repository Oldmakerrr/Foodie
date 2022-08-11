//
//  Place.swift
//  Foodie
//
//  Created by Apple on 10.08.2022.
//

import Foundation

struct Place: Codable {
    
    var placeInfo: PlaceInfo

    enum CodingKeys: String, CodingKey {
        case placeInfo = "restaurant"
    }
    
    struct PlaceInfo: Codable {
        var name: String
        var location: LocationInfo
        var imageURL: String
        var thumbImage: String
        var website: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case location = "location"
            case imageURL = "featured_image"
            case thumbImage = "thumb"
            case website = "url"
        }
        
        struct LocationInfo: Codable {
            var address: String
        }
    }
    
}
