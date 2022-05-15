//
//  ContentView.swift
//  UIActivityIndicatorView
//
//  Created by Doris Trakarskys on 2022/5/15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    var body: some View {
        ZStack{
            Color(.orange)
                .ignoresSafeArea()
            
            Text("Hello World")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            if isLoading {
                LoadingView()
            }
        }
        .onAppear {
            startFakeNetCall()
        }
    }
    func startFakeNetCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(3)
        }
    }
}
