//
//  RecipeRow.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    var body: some View {
        Color.green
            .overlay(
            HStack{
                SquareRoundBorder(image: recipe.image)
                    .frame(width:90, height:90)
                VStack{
                    Text(recipe.name)
                        .font(.title)
                    
                    HStack{
                        VStack{
                            HStack{
                                Image("spiceIcon")
                                Text(recipe.spice)
                                    .foregroundStyle(.white)
                            }
                            HStack{
                                Image("timeIcon")
                                Text(recipe.time)
                                    .foregroundStyle(.white)
                            }
                                                   }
                        VStack{
                            HStack{
                                Image("difficultyIcon")
                                Text(recipe.difficulty)
                                    .foregroundStyle(.white)
                            }
                            HStack{
                                Image("distanceIcon")
                                Text(recipe.distance)
                                    .foregroundStyle(.white)
                            }
                            
                        }
                    }
                }
                Spacer()
            }
        )
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: recipes[0])
    }
}
