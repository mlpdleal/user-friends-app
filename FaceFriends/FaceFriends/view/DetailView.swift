//
//  DetailView.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
    
        NavigationView{
                Form{
                    Section{
                        Text("Name: \(user.name)")
                        Text("Age: \(user.age)")
                        Text("Company: \(user.company)")
                        Text("E-mail: \(user.email)")
                        Text("Adress: \(user.address)")
                    } header: {
                        Text("Personal information")
                    }
                    
                    Section{
                        Text(user.about)
                    } header: {
                        Text("Description")
                    }
                    
                    Section{
                        List{
                            ForEach(user.tags, id: \.self){
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Tags")
                    }
                    
                    Section{
                        List{
                            ForEach(user.friends, id: \.id){
                                Text($0.name)
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


