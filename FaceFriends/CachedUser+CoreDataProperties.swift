//
//  CachedUser+CoreDataProperties.swift
//  FaceFriends
//
//  Created by Manoel Leal on 27/06/22.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var tags: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var friends: Set<CachedFriends>
    
    public var wrappedAbout: String {
        about ?? "Unknown"
    }
    
    public var wrappedAddress: String{
        address ?? "Unknown adress"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedId: String{
        id ?? "Unknown id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedTags: String {
        tags ?? "Unknown"
    }
    
    
    public var cachedFriendsArray: [CachedFriends]{
        let set = friends as? Set<CachedFriends> ?? []
        
        return set.sorted{
            $0.wrappedId < $1.wrappedId
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
