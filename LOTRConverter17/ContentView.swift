//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo  = false
    @State var letAmount = ""
    @State var rightAmount = ""
    
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
                            Image(.silverpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                            
                            //text
                            Text("Sliver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,-5)
                        //text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                 
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
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
    
                            //image
                            Image(.goldpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom,-5)
                        //text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
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
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
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
