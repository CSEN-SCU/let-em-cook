//
//  RecipeDetail.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/25/23.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    var body: some View {
        Text(recipe.name)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipes[0])
    }
}
