//
//  CachedFriends+CoreDataProperties.swift
//  FaceFriends
//
//  Created by Manoel Leal on 27/06/22.
//
//

import Foundation
import CoreData


extension CachedFriends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriends> {
        return NSFetchRequest<CachedFriends>(entityName: "CachedFriends")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: NSSet?
    
    public var wrappedId: String {
        id ?? "Unknown Id"
    }
    
    public var wrappedName: String{
        name ?? "Unknown name"
    }
    
    public var userCachedArray: [CachedUser]{
        let set = user as? Set<CachedUser> ?? []
        
        return set.sorted{
            $0.wrappedId < $1.wrappedId
        }
    }

}

// MARK: Generated accessors for user
extension CachedFriends {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: CachedUser)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: CachedUser)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension CachedFriends : Identifiable {

}
