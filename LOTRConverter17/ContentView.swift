//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo  = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece

    var body: some View {
        ZStack{
            //background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                //Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency exchange
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                //currency conversion section
                HStack{
                    //left conversion section
                    VStack{
                        //currency
                        HStack{
                            //image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                            
                            //text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                           
                        }
                        //text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                 
                    }
                    //equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    //right conversion section
                    VStack{
                        //currency
                        HStack{
                            //text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
    
                            //image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                           
                        }
                        //text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)


                    }
                    
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                //Info button
                Spacer()
                HStack {
                    Button{
                        showExchangeInfo.toggle()
                        
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.trailing)
                    .onChange(of: rightAmount){
                        
                        if rightTyping{
                            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                            
                        }
                    }
                    .onChange(of: leftAmount){
                        if leftTyping {
                            rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency
                            )
                        }
                    }
                    .onChange(of: leftCurrency){
                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                        
                        
                    }
                    .onChange(of: rightCurrency){
                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        
                        
                    }
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency){
                        SelectCurrency(topCurrency: $leftCurrency,bottomCurrency: $rightCurrency)
                    }
                    
                    
                }

            }
          
            
        }
//        .border(.blue)

       
    }
}

#Preview {
    ContentView()
}
