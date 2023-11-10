//
//  RecipeList.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: Meals?
    var body: some View {
        
        NavigationView{
            List(recipes?.meals ?? []) { recipe in
                NavigationLink{
                    Text(recipe.strMeal ?? "NA")
                    //RecipeDetail(recipe: recipe)
                } label: {
                    TestView(recipe: recipe)
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
               
                               
            }
                .navigationTitle("Recipes")
        }
        
        
        
    

    }
}

//struct RecipeList_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
