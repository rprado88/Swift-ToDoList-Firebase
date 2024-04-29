//
//  User.swift
//  ToDoList
//
//  Created by Rodrigo Prado on 22/04/24.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
