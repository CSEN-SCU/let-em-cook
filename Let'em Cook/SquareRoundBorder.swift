//
//  SquareRoundBorder.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 10/24/23.
//

import SwiftUI

struct SquareRoundBorder: View {
    var image:Image
    var body: some View {
        image
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay{
                RoundedRectangle(cornerRadius:10)
                    .stroke(.white,lineWidth: 4)
            }
            .shadow(radius: 7)
            

    }
}

struct SquareRoundBorder_Previews: PreviewProvider {
    static var previews: some View {
        SquareRoundBorder(image: Image("burrito"))
    }
}
