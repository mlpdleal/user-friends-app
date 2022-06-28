//
//  FaceFriendsApp.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import SwiftUI

@main
struct FaceFriendsApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
