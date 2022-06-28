//
//  ContentView.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userFetcher = UserFetcher()
    @Environment(\.managedObjectContext) var moc
    @State private var showingOffline = false
    
    @FetchRequest(sortDescriptors: [])  var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView{
            List{
                if showingOffline{
                    ForEach(users, id: \.id) { user in
                        NavigationLink{
                            DetailCachedView(user: user)
                        } label: {
                            Text(user.wrappedName)
                        }
                    }
                }
                else {
                    ForEach(userFetcher.users, id: \.id) { user in
                        NavigationLink{
                            DetailView(user: user)
                        } label: {
                            Text(user.name)
                        }
                    }

                }
                
            }
            .navigationTitle("Users")
            .task {
                await userFetcher.loadData(context: moc)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showingOffline.toggle()
                    } label: {
                        Image(systemName: "shuffle")
                    }
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
