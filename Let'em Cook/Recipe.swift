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

struct Meal: Decodable{
    var idMeal: String
    
    var name: String?
    var description: String?
    var category:String?
    var distance:String?
    var difficulty:String?
    var spice:String?
    var time:String?
    
    
    var strMeal:String?
    var strDrinkAlternate:String?
    var strArea:String?
    var strInstructions:String?
    var strMealThumb:String?
    var strTags:String?
    var strIngredient1:String?
    var strIngredient2:String?
    var strIngredient3:String?
    var strIngredient4:String?
    var strIngredient5:String?
    var strIngredient6:String?
    var strIngredient7:String?
    var strIngredient8:String?
    var strIngredient9:String?
    var strIngredient10:String?
    var strIngredient11:String?
    var strIngredient12:String?
    var strIngredient13:String?
    var strIngredient14:String?
    var strIngredient15:String?
    var strIngredient16:String?
    var strIngredient17:String?
    var strIngredient18:String?
    var strIngredient19:String?
    var strIngredient20:String?
    
    var strMeasure1:String?
    var strMeasure2:String?
    var strMeasure3:String?
    var strMeasure4:String?
    var strMeasure5:String?
    var strMeasure6:String?
    var strMeasure7:String?
    var strMeasure8:String?
    var strMeasure9:String?
    var strMeasure10:String?
    var strMeasure11:String?
    var strMeasure12:String?
    var strMeasure13:String?
    var strMeasure14:String?
    var strMeasure15:String?
    var strMeasure16:String?
    var strMeasure17:String?
    var strMeasure18:String?
    var strMeasure19:String?
    var strMeasure20:String?
    
    var strSource:String?
    var strImageSource:String?
    var strCreativeCommonsConfirmed:String?
    var dateModified:String?
    
}
// Now conform to Identifiable
extension Meal: Identifiable {
    var id: String { return idMeal  }
}
struct Meals: Decodable{
    let meals:[Meal]
}
