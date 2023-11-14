//
//  Store.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 11/14/23.
//

import Foundation

struct Store: Decodable, Identifiable{
    var id:String = UUID().uuidString
    var name:String
    var latitude:Float
    var longitude:Float
    var ingredients: [Ingredient] = []
}
