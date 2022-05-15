//
//  ContentView.swift
//  loading progress
//
//  Created by Doris Trakarskys on 2021/5/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading = false
    
    var body: some View {
        
        VStack{
            ZStack {
                ActivityIndicatorView(isDisplayed: $isLoading){
                        Text("")
                }
            }
            .padding()
                
                
            Button(action: {
                isLoading.toggle()
            }, label: {
                Text("Button")
            })
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
