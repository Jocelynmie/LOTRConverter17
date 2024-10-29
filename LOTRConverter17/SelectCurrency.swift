//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/29/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var currency: Currency
    
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
                LazyVGrid(columns:[GridItem(),GridItem(),GridItem()])
                {
                    ForEach(Currency.allCases){
                        currency in
                        if self.currency == currency{
                            CurrencyIcon(currencyImage: currency.image, currencyName:currency.name)
                                .shadow(color: .black, radius: 10)
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 3)
                                    .opacity(0.5))
                            
                        }
                        else{
                            CurrencyIcon(currencyImage: currency.image, currencyName:currency.name)
                                .onTapGesture {
                                    self.currency = currency
                                }
                        }
                    }
                }
                    
                
                
                //currency icons
                

               
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

                      
                
                
                //currency icons
                
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
    SelectCurrency(currency: .copperPenny)
}

