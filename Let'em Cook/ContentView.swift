//
//  ContentView.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/17/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var title: String = "hi"
    @State private var isActive = false
    @State private var meal: Meal?
    @ObservedObject var vm = RecipeViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text(title)
                NavigationLink(destination:RecipeList(recipe: meal),isActive: $isActive){
                    Button(action: {
                        Task{
                            
                            await vm.randomMeal()
                            meal = vm.meals?.meals.first
                            print("Hello")
                            isActive=true
                        }
                        
                    }) {
                        Text("Random Meal")
                    }
                }
            }
            
        }
    }
}
/*
func randomMeal() async throws->Meals{
    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
    let meals:Meals = try JSONDecoder().decode(Meals.self, from: data)
    return meals
}
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

