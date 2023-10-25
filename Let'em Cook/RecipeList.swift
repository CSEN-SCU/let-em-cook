//
//  RecipeList.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        
        NavigationView{
        
            List(recipes) { recipe in
                NavigationLink{
                    RecipeRow(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                        .frame(width: 900, height: 110)
                }
                               
            }
                .navigationTitle("Recipes")
        }
        
        
        
    

    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}