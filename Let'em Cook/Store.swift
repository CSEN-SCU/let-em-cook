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
    var ingredients: [String] = []
}
//Function that takes store and Meal and finds if all the recipes in the Meal can be found in the store
func locateIngridients(store: Store, meal:Meal) -> Bool {
    for ingredient in meal.ingredients{
        print(ingredient.id,ingredient.name)
    }
    for ingredient in store.ingredients{
        print(ingredient)
    }
    return false
}
