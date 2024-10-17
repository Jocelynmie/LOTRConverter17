//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by JocleynYang on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo  = false
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
                        //text field
                        Text("textfield")
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
                        //text field
                        Text("textfield")
                    }
                    
                }
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
                }

            }
          
            
        }
//        .border(.blue)

       
    }
}

#Preview {
    ContentView()
}
