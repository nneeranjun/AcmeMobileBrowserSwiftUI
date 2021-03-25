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
    
    @Binding var url: String
    //@ObservedObject var viewModel: WebViewModel
    @Binding var webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView  {
        print("make UI view")
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: URL(string: url)!))
        return webView
    }
    
//    func onTabChanged(webView: WKWebView) -> some View {
//        var copy = self
//        copy.webView = webView
//        return copy
//    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        return
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        //private var viewModel: WebViewModel
        private var webView: WebView

        init(_ webView: WebView) {
            print("initializsing coord")
            self.webView = webView
        }

//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            print("finished loading")
//            self.webView.url = webView.url!.absoluteString
//        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            self.webView.url = webView.url!.absoluteString
        }
    }
    
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator(self)
    }
    
}

//class WebViewModel: ObservableObject {
//
//    @Published var webView: WKWebView
//
//    init(webView: WKWebView) {
//        self.webView = webView
//    }
//
////    func loadPage(url: String) {
////        print(url)
////        if let url_object = URL(string: url) {
////            print("processing request")
////            let request = URLRequest(url: url_object)
////            webView.load(request)
////        } else {
////            print("error")
////        }
////
////    }
//
//}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: .constant("https://www.apple.com"), webView: .constant(WKWebView()))
    }
}


