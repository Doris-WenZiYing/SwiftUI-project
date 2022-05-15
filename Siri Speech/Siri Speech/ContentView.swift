//
//  ContentView.swift
//  siri-customize
//
//  Created by Doris Trakarskys on 2022/2/11.
//

import SwiftUI

import AVFoundation

struct ContentView: View {
    
    @State private var text: String = ""
    @State var gender: Int = 1
    
    var body: some View {
        
        VStack{
            
            Text(text)
            
                .padding()
                .font(.title)
                .foregroundColor(Color.red)
            
            TextField("Type here...", text: $text)
            
                .padding()
            
            Button("Speak") {
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.stopSpeaking(at: .immediate)
                
                let utterance = AVSpeechUtterance(string: text)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance.pitchMultiplier = 1
                utterance.rate = 0.4
                synthesizer.speak(utterance)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
    
}
