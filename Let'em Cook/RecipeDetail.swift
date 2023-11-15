//
//  RecipeDetail.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/25/23.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Meal
    var body: some View {
            ScrollView {
                ZStack{
                    AsyncImage(url: URL(string:recipe.thumbnail ?? "NA" ))
                        { image in image.resizable() }
                        placeholder: { Color.gray }
                            .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Instructions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                    
                    Text(recipe.instructions)
                        .font(.body)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Text("Ingredients")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Button {
                            // should go to page with map
                            // stores + coordinates can be found under recipe.stores
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
                        ForEach(recipe.ingredients, id: \.self) { data in
                            Text("•  \(data.name)")
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
            .navigationTitle(recipe.name)
    }
}

//
//struct RecipeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetail(recipe: recipes[1])
//    }
//}
