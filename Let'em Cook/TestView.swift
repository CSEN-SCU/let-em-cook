//
//  RecipeRow.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct RecipeRow: View {
    var recipe:Meal?
    //@State private var recipe: Meal?
    @ObservedObject var vm = RecipeViewModel()
    
    var body: some View {
       // Color.green
       //     .overlay(
            HStack {
                AsyncImage(
                    url: URL(string:recipe?.thumbnail ?? "NA" )
                )
                    { image in image.resizable() }
            placeholder: { Color.gray }
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay{
                        RoundedRectangle(cornerRadius:10)
                            .stroke(.white,lineWidth: 4)
                    }
                    .shadow(radius: 7)


                Spacer()
                VStack(spacing:-15){
                    Text(recipe?.name ?? "NA")
                        .font(.title)
                    HStack{
                    VStack{
                        
                            HStack{
                                Image(systemName:"chart.bar.fill")
                                    //Text(recipe?.strInstructions ?? "NA")
                                    Text(String(Int.random(in: 0..<6)))
                                    .foregroundStyle(.black)
                            }
                                .padding()
                                .cornerRadius(10)
                            HStack{
                                Image(systemName:"timer")
                                    .foregroundStyle(.black)
                                //Text(recipe?.time ?? "NA")
                                Text(String(Int.random(in: 0..<6)))
                                    .foregroundStyle(.black)
                            }
                                .cornerRadius(10)
                        }
                    Spacer()
                    VStack {
                        HStack{
                            Image(systemName: "flame.fill")
                            //Text(recipe?.spice ?? "NA")
                            Text(String(Int.random(in: 0..<6)))
                                .foregroundStyle(.black)
                             
                        }
                            .padding()
                            .cornerRadius(10)
                        HStack{
                            Image(systemName:"location.fill")
                                //Text(recipe?.distance ?? "NA")
                                Text(String(Int.random(in: 0..<6)))
                                .foregroundStyle(.black)
                        }
                            .cornerRadius(10)
                    }
                    Spacer()
                    }
                }
            }
//            .onAppear{
//                Task{
//                    print("Hello World")
//                    await vm.randomMeal()
//                    recipe=vm.meals?.meals.first
//                }
//            }
        }
    }


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            
            //TestView(recipe: recipes[0])
            //TestView(recipe: recipes[1])

            
        }
    }
}
