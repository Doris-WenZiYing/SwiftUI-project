//
//  GifImage.swift
//  gif
//
//  Created by Doris Trakarskys on 2022/1/21.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String){
        self.name = name
    }
    
    
    func makeUIView(context: Context) -> some WKWebView {
        
        let webView = WKWebView()
        
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
       
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        
        webView.scrollView.isScrollEnabled = false
        
        return webView
    }
    //you need to get the uiView you made in makeView function
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("delete")
    }
}
