//
//  ContentView.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var url: String = "https://medium.com/macoclock/how-to-use-webkit-webview-in-swiftui-4b944d04190a"
    
    var body: some View {
        VStack {
            HStack {
                ToolBar(url: url)
            }
            WebView(request: URLRequest(url: URL(string: url)!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
