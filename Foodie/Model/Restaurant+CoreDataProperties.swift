//
//  Restaurant+CoreDataProperties.swift
//  Foodie
//
//  Created by Apple on 10.08.2022.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var address: String?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var website: String?
    @NSManaged public var storedLocation: StoredLocation?

}

extension Restaurant : Identifiable {

}
