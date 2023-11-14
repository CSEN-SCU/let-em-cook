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
func locateIngredients(stores: [Store], meal:Meal) -> [Store] {
    var res:[Store]=[]
    var storeIngredients:Set<String>=[]
    var mealIngredients:Set<String>=[]
    for ingredient in meal.ingredients{
        mealIngredients.insert(ingredient.name.lowercased())
    }
    
    for store in stores{
        for s in store.ingredients{
            storeIngredients.insert(s.lowercased())
        }
        if mealIngredients.isSubset(of: storeIngredients){
            res.append(store)
        }
        storeIngredients=[]
    }
    print(mealIngredients)
    return res
}
