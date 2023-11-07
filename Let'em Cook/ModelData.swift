//
//  ModelData.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import Foundation

var recipes: [Recipe] = load("recipeData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data:Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
/*
func randomMeal() async throws->Meals{
    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
    let meals:Meals = try JSONDecoder().decode(Meals.self, from: data)
    return meals
}*/
