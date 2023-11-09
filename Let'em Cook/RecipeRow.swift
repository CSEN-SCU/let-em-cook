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
       // Color.green
       //     .overlay(
            
                
                        HStack {
                            SquareRoundBorder(image: recipe.image)
                                .frame(width:100, height:100)
                                .cornerRadius(10)
                            Spacer()
                            VStack(spacing:-15){
                                Text(recipe.name)
                                    .font(.title)
                                HStack{
                                VStack{
                                    
                                        HStack{
                                            Image(systemName:"chart.bar.fill")
                                            Text(recipe.difficulty)
                                                .foregroundStyle(.black)
                                        }
                                            .padding()
                                            .cornerRadius(10)
                                        HStack{
                                            Image(systemName:"timer")
                                                .foregroundStyle(.black)
                                            Text(recipe.time)
                                                .foregroundStyle(.black)
                                        }
                                            //.padding()
                                            .cornerRadius(10)
                                    }
                                Spacer()
                                VStack {
                                    HStack{
                                        Image(systemName: "flame.fill")
                                        Text(recipe.spice)
                                            .foregroundStyle(.black)
                                    }
                                        .padding()
                                        .cornerRadius(10)
                                    HStack{
                                        Image(systemName:"location.fill")
                                        Text(recipe.distance)
                                            .foregroundStyle(.black)
                                    }
                                        //.padding()
                                        .cornerRadius(10)
                                }
                                Spacer()
                                }
                            }
                        }
                    
        }
        
    }


struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RecipeRow(recipe: recipes[0])
            RecipeRow(recipe: recipes[1])

            
        }
    }
}
