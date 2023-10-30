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
                    RecipeDetail(recipe: recipe)
                } label: {
                    
                    RecipeRow(recipe: recipe)
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                }
                .background(.gray)
                               
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
