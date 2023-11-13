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
    @State private var meals: Meals?
    @ObservedObject var vm = RecipeViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text(title)
                NavigationLink(destination: RecipeList(recipes: vm.meals) , isActive: $isActive){
                    Button(action: {
                        Task{
                            await vm.mealsByIngredient(c:"chicken")
                            isActive=true
                        }
                    }) {
                        Text("Random Meals")
                    }
                }
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

