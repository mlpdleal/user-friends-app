//
//  ContentView.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userFetcher = UserFetcher()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(userFetcher.users, id: \.id) { user in
                    NavigationLink{
                        DetailView(user: user, friend: user.friends)
                    } label: {
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await userFetcher.loadData()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
