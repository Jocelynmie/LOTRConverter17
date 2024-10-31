//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/29/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var leftCurrency = Currency.copperPenny
    @State var rightCurrency = Currency.goldPenny
    
    var body: some View {
        ZStack{
            //perchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //text
                Text("Select the currency you are starting with :")
                    .fontWeight(.bold)
            

                //currency icons
                IconGrid(currency: leftCurrency)

                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

    
                //currency icons
                IconGrid(currency: rightCurrency)
                
                //Done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}

