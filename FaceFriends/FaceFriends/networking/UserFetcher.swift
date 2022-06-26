//
//  UserFetcher.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import Foundation

class UserFetcher: ObservableObject{
    
    @Published var users = [User]()
    
    init(){
        
    }

    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data){
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
    
}
