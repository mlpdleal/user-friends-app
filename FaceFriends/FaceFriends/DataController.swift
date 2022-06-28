//
//  DataController.swift
//  FaceFriends
//
//  Created by Manoel Leal on 27/06/22.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "FaceFriends")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core data failed \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
}
