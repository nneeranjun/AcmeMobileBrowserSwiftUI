//
//  WebView.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

import SwiftUI

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    @State var request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
