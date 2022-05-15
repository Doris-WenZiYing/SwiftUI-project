//
//  ContentView.swift
//  gif
//
//  Created by Doris Trakarskys on 2022/5/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            List(0 ..< 6){ item in
                GifImage("delete")
                    .frame(width: 200, height: 120, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
