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
    
    var body: some View {
        VStack{
            Text(title)
            Button(action: {
                Task{
                    
                    do{
                        let meals:Meals = try await randomMeal()
                        title = meals.meals.first?.strMeal ?? "Unknown Meal"
                    }
                    catch{
                        print("Couldn't parse as:\n\(error)")
                        
                    }
                }
            }) {
                Text("Random Meal")
                
            }
        }
    }
}

func randomMeal() async throws->Meals{
    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
    let meals:Meals = try JSONDecoder().decode(Meals.self, from: data)
    return meals
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

