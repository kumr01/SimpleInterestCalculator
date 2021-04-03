//
//  ContentView.swift
//  SimpleInterestCalc
//
//  Created by R Kumar on 4/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var intrest=""
    @State var time = ""
    @State var principal = ""
    @State var result="0.00"
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Simple Interest Calculator!").font(.title).bold().padding()
                
                HStack{
                    Text("Result : ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    Image("icons8-us-dollar-64")
                    Text(result).font(.title).bold()
                    .background(Color.white)
                    .foregroundColor(.green)
                   
                } .frame(alignment: .center)
            }
        
            VStack {
                TextField("Principal Amount($0.00)", text: $principal)
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 8).padding()
                
                TextField("Rate(%)", text: $intrest)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 8).padding()
                    
                TextField("Time(Years)", text: $time)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 8).padding()
                    
            }
            VStack{
                HStack{
                    Button(action: calculate) {
                        Text("Calculate!" ).font(.title).padding()
                        .frame(width: 160, height: 55, alignment: .center)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())

                    }
                    Button(action: reset) {
                        Text("Reset!" ).font(.title).padding()
                        .frame(width: 160, height: 55, alignment: .center)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())

                    }
                  
                }
            }
            Spacer()
        }
        
    }
    
    func calculate() {
        let timeData = Float(time) ?? 0.0
        let intrestData = Float(intrest) ?? 0.0
        let principalData = Float(principal) ?? 0.0
        
        let resultData =  principalData * ( 1 + ((timeData/100) * intrestData))
        result = String(format: "%.2f", resultData)
    }

    func reset() {
        principal = ""
        time = ""
        intrest=""
        result = String(format: "%.2f", 0.0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
