//
//  User.swift
//  FaceFriends
//
//  Created by Manoel Leal on 25/06/22.
//

import Foundation

struct User: Codable, Hashable{
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registred: Date?
    let tags: [String]
    let friends: [Friend]
    
}
