//
//  RecipeDetail.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/25/23.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Meal
    var dummyIngredients: [String] = ["Burrito", "Person to eat the burrito"]
    var body: some View {
            ScrollView {
                ZStack{
//                    recipe.image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                    AsyncImage(url: URL(string:recipe.strMealThumb ?? "NA" ))
                        { image in image.resizable() }
                        placeholder: { Color.gray }
                            .frame(width: .infinity)
                            .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                    
                    Text(recipe.description ?? "No description provided.")
                        .font(.body)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Text("Ingredients")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Button {
                            // should go to page with map
                        } label: {
                            VStack{
                                Image(systemName: "location.north.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundStyle(.blue)
                                    .padding(.leading, 10)
                            }
                        }
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 5){
                        ForEach(dummyIngredients, id: \.self) { data in
                            Text("•  \(data)")
                        }
                    }
                    
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .padding(20)
                .background(Color.white)
                .cornerRadius(40.0)
                .offset(y:-40)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .navigationTitle(recipe.strMeal ?? "Unnamed Recipe")
    }
}
//
//struct RecipeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetail(recipe: recipes[1])
//    }
//}
