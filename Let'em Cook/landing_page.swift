//
//  landing_page.swift
//  Let'em Cook
//
//  Created by Aakash Shetty on 11/7/23.
//

import SwiftUI

extension Color
{
    init(hex: UInt)
    {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1.0
        )
    }
}

struct landing_page: View {
    @ObservedObject var vm = RecipeViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("\nLET'EM \n COOK!").font(.system(size: 60, design: .rounded)).foregroundColor(.white)
                Image("logo2").resizable().padding(50);
                Spacer()
                Color.white.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 250).overlay(
                    VStack { // Change 'Group' to 'VStack'
                        Text("Find ").font(.system(size: 35, design: .rounded)).foregroundColor(.black)+Text("recipes").bold().font(.system(size: 35, design: .rounded)).foregroundColor(Color(hex: 0x63A313))+Text("\n near you!").font(.system(size: 35, design: .rounded)).foregroundColor(.black)
                        NavigationLink(destination: RecipeList(vm:vm)) {
                            Text("Search Now!")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color(hex: 0x63A313))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(10)
                                .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(hex: 0x63A313), lineWidth: 5))
                        }
                    }
                ).ignoresSafeArea()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: 0x63A313)).ignoresSafeArea()
        }
        //.padding()
    }
}


//#Preview {
//    landing_page()
//}
