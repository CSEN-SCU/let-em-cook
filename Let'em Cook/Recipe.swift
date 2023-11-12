//
//  Recipe.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Recipe: Hashable,Identifiable,Decodable{
    //Recipe.json file structure
    var id: Int
    var name: String
    var description: String
    var category:String
    var distance:String
    var difficulty:String
    var spice:String
    var time:String
    
    private var imageName: String
    var image: Image{
        Image(imageName);
    }
    
}

struct Meal: Decodable {
    var idMeal: String = UUID().uuidString
    var name: String = "Unnamed Recipe"
    var instructions: String = "No instructions provided."
    var thumbnail: String? = nil
    var ingredients: [String] = []
    var measures: [String] = []
    var category: String = "Unspecified"
    var origin: String = "Unspecified"

    var distance: String = "0"
    var difficulty: String = "0"
    var spice: String = "0"
    var time: String = "0"
}

// Now conform to Identifiable
extension Meal: Identifiable {
    var id: String { return idMeal  }
}
struct Meals: Decodable{
    let meals:[Meal]
}
