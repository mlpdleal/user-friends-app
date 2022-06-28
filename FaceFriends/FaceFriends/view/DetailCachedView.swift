//
//  DetailCachedView.swift
//  FaceFriends
//
//  Created by Manoel Leal on 27/06/22.
//

import SwiftUI

struct DetailCachedView: View {
    let user: CachedUser
    
    var body: some View {
    
        NavigationView{
                Form{
                    Section{
                        Text("Name: \(user.wrappedName)")
                        Text("Age: \(user.age)")
                        Text("Company: \(user.wrappedCompany)")
                        Text("E-mail: \(user.wrappedEmail)")
                        Text("Adress: \(user.wrappedAddress)")
                        Text("Tags: \(user.wrappedTags)")
                    } header: {
                        Text("Personal information")
                    }
                    
                    Section{
                        Text(user.wrappedAbout)
                    } header: {
                        Text("Description")
                    }
                    
                    Section{
                        List{
                            ForEach(user.wrappedTags.components(separatedBy: ","), id: \.self){
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Tags")
                    }
                    
                    Section{
                        List{
                            ForEach(user.cachedFriendsArray, id: \.self){
                                Text($0.wrappedName)
                            }
                        }
                    } header: {
                        Text("Friends")
                    }
                    
                    
  
 
                    
                }
                .navigationTitle("User")
                .navigationBarTitleDisplayMode(.inline)
            
        }
                
       
            
     
        
    }
}


