//
//  StoredLocation+CoreDataProperties.swift
//  Foodie
//
//  Created by Apple on 10.08.2022.
//
//

import Foundation
import CoreData


extension StoredLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredLocation> {
        return NSFetchRequest<StoredLocation>(entityName: "StoredLocation")
    }

    @NSManaged public var name: String?
    @NSManaged public var restaurants: NSSet?

}

// MARK: Generated accessors for restaurants
extension StoredLocation {

    @objc(addRestaurantsObject:)
    @NSManaged public func addToRestaurants(_ value: Restaurant)

    @objc(removeRestaurantsObject:)
    @NSManaged public func removeFromRestaurants(_ value: Restaurant)

    @objc(addRestaurants:)
    @NSManaged public func addToRestaurants(_ values: NSSet)

    @objc(removeRestaurants:)
    @NSManaged public func removeFromRestaurants(_ values: NSSet)

}

extension StoredLocation : Identifiable {

}
