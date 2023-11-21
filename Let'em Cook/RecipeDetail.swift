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
                
                HStack(){
                                        Spacer()
                                        NavigationLink{
                                            UserMapView(recipe: recipe)
                                        } label: {
                                            HStack(){
                                                Image(systemName: "location.north.circle")
                                                Text("View Stores")
                                            }
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .padding()
                                            .background(Color(hex: 0x63A313))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(hex: 0x63A313), lineWidth: 5))
                                        }
                                        Spacer()
                                  }.padding(.top, 20)
                
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
