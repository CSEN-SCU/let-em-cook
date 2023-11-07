//
//  ContentView.swift
//  Let'EmCook Search Bar
//
//  Created by Chris Augustine on 10/27/23.
//

import SwiftUI
extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1.0
        )
    }
}

struct ContentView: View {
    private var listofRecipe = RecipeList;
    @State var searchText = "";
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
            NavigationView{
                List{
                    ForEach(recipes, id: \.self){recipes in
                        HStack{
                            Text(recipes.capitalized)

                            Spacer()
                            Image("Logo")
                                .resizable()
                                .frame(width: 40, height: 50)
                            
                        }
                        .padding()
                        .background(Color(hex: 0x63A313))
                    }
                }
                .navigationTitle("Recipes")
            }
      }
        
        
        
    }
    var recipes: [String]{
        let lcRecipes = listofRecipe.map{$0.lowercased()}
        return searchText == "" ? lcRecipes : lcRecipes.filter{
            $0.contains(searchText.lowercased())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                
                .background(Color.white)
                .cornerRadius(8)
                .padding([.leading, .trailing])
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.top, 8)
                .padding(.bottom, 4)
                 Image(systemName: "SearchIcon")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
        }
        .background(Color(hex: 0x63A313))
    }
}
