//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/29/24.
//

import Foundation
import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let text:String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            //left currency
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            
            //exchange rate text
            Text(text)
            
            //right currency
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview{
    ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
