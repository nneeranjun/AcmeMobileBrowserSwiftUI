//
//  WebView.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

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
    
    //@Binding var tab: Tab
    //@Binding var url: URL
    @ObservedObject var tab: Tab
    
    var webView: WKWebView {
        tab.webView
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        print("make UI view")
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: tab.url))
        print(tab.url)
        return webView
    }
    
//    func onTabChanged(webView: WKWebView) -> some View {
//        var copy = self
//        copy.webView = webView
//        return copy
//    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: tab.url))
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        //private var viewModel: WebViewModel
        private var webView: WebView

        init(_ webView: WebView) {
            self.webView = webView
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Starting")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("finished loading")
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            guard let newURL = webView.url else {
                return
            }
            
            //print("New: \(newURL)")
            //print("Old: \(self.webView.tab.url)")
            
            if self.webView.tab.url != newURL {
                self.webView.tab.url = webView.url!
            }
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

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView(url: .constant("https://www.apple.com"), webView: WKWebView())
//    }
//}





