//
//  ContentView.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State var url: String = "https://google.com"
    @State var webView: WKWebView = WKWebView()
    
    //var tabs: [WKWebView] = []
    
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    TextField("Search...", text: $url, onCommit: {
                        webView.load(URLRequest(url: URL(string: url)!))
                    })
                        .padding(10)
                        .modifier(ClearButton(text: $url))
                        .padding(.horizontal, 20)
                        .background(Color(.tertiarySystemFill))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .keyboardType(.webSearch)
                    
                    Button(action: {
                        webView.reload()
                    }, label: {
                        Image(systemName: "gobackward")
                            .font(.title2)
                    })
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
            Spacer()
            WebView(url: $url, webView: $webView)
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    webView.goBack()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                })
                Spacer()
                Button(action: {
                    print("sdd")
                    self.webView = WKWebView()
                    self.webView.reload()
                    
                }, label: {
                    Image(systemName: "doc.on.doc")
                        .font(.title)
                })
                Spacer()
                Button(action: {
                    webView.goForward()
                }, label: {
                    Image(systemName: "arrow.forward")
                        .font(.title)
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
