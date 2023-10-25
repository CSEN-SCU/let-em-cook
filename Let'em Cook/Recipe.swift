//
//  Recipe.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Recipe: Hashable,Codable,Identifiable{
    var id: Int
    var name: String
    var description: String
    var category:String
    var distance:String
    var difficulty:String
    var spice:String
    var time:String
    
    private var imageName: String
    var image: Image{
        Image(imageName);
    }
}
