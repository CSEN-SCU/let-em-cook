//
//  RecipeList.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct RecipeList: View {
    @State var searchTerm: String = ""
    @ObservedObject var vm = RecipeViewModel()
    var body: some View {
        VStack {
            SearchBar(searchTerm: $searchTerm).onSubmit {
                Task{
                    await vm.mealsBySearch(c: searchTerm)
                    print(stores)
                }
            }
            List(vm.meals?.meals ?? []) { recipe in
                NavigationLink{
                    RecipeDetail(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                
            }.navigationTitle("Recipes")
        }
    }
}

struct SearchBar: View {
    @Binding var searchTerm: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
            TextField("Search", text: $searchTerm)
                .foregroundColor(Color.black)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15),
                       radius: 10,
                       x: 0,
                       y: 0)
        )
        .padding()
    }
}

struct RecipeList_Previews: PreviewProvider {
    @State static var searchTerm: String = ""
    static var previews: some View {
//        SearchBar(searchTerm: $searchTerm)
        ContentView()
    }
}
