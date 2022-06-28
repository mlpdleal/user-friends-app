//
//  UserFetcher.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import Foundation
import CoreData

class UserFetcher: ObservableObject{
    
    @Published var users = [User]()
    
    init(){
        
    }

    func loadData(context: NSManagedObjectContext) async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([User].self, from: data)
                
            DispatchQueue.main.async {
                self.users = decodedResponse
                self.saveData(context: context)
            }
            
        } catch {
            print("Invalid data")
        }
    }
    
    func saveData(context: NSManagedObjectContext){
        
        users.forEach{ (data) in
            
            let user = CachedUser(context: context)
            
            
            user.id = data.id
            user.isActive = data.isActive
            user.name = data.name
            user.company = data.company
            user.about = data.about
            user.address = data.address
            user.age = Int16(data.age)
            user.email = data.email
            user.tags = data.tags.joined(separator: ",")
            
            data.friends.forEach{ (friend) in
                let cachedFriend = CachedFriends(context: context)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                user.friends.insert(cachedFriend)
            }
        
        }
        
        do{
            try context.save()
            print("Success")
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
