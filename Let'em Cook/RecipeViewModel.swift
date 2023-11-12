//
//  RecipeViewModel.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 11/9/23.
//

import SwiftUI

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class WebService: Codable {
    func downloadData<T: Decodable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        
        return nil
    }
}

@MainActor class RecipeViewModel: ObservableObject {
    @Published var meals: Meals?
    @Published var meal:Meal?
    init(){
        print("Recipe View Model Init")
    }
    func randomMeal() async{
        guard let data: Meals = await WebService().downloadData(fromURL: "https://www.themealdb.com/api/json/v1/1/random.php") else {return}
        meals=data
    }
    func mealsByFirstLetter(c: String) async{
        if (c.count > 1){
            return
        }
        guard let data: Meals = await WebService().downloadData(fromURL: "https://themealdb.com/api/json/v1/1/search.php?f="+c) else {return}
        meals=data
    }
    func mealsBySearch(c: String) async{
        guard let data: Meals = await WebService().downloadData(fromURL: "https://themealdb.com/api/json/v1/1/search.php?s="+c) else {return}
        meals=data
    }
    func mealsByIngridient(c:String) async{
        guard let data: Meals = await WebService().downloadData(fromURL: "https://www.themealdb.com/api/json/v1/1/filter.php?i="+c) else {return}
        meals=data
        print(await WebService().downloadData(fromURL: "https://www.themealdb.com/api/json/v1/1/filter.php?i="+c))
    }
}
