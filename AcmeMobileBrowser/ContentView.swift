//
//  ContentView.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

import SwiftUI
import WebKit

class Tab: ObservableObject, Identifiable {
    let webView: WKWebView = WKWebView()
    
    let id: Int
    @Published var url: URL {
        didSet {
            print("URL: \(url)")
        }
    }
    
    init(id: Int, url: URL) {
        self.id = id
        self.url = url
    }
}

//class ContentViewStore: ObservableObject {
//    @Published var tabs: [Tab] = [
//        Tab(id: 0, url: URL(string: "https://news.ycombinator.com")!),
//        Tab(id: 1, url: URL(string: "https://www.bing.com")!),
//        Tab(id: 2, url: URL(string: "https://www.google.com")!)
//    ]
//
//    @Published var selectedIndex: Int = 0
//
//    @Published var currentURL: String = "yolo"
//
//    init() {
//        Publishers.MergeMany(
//            tabs.map { $0.$url}
//        )
//            ...
//        .assign(to: \.currentURL, on: self)
//            ...
//
//    }
//}

struct ContentView: View {
    
    @State var url: String = "https://google.com"
    @State var isPresented: Bool = false
    @State var tabs: [Tab] = [
        Tab(id: 0, url: URL(string: "https://news.ycombinator.com")!),
        Tab(id: 1, url: URL(string: "https://www.bing.com")!),
        Tab(id: 2, url: URL(string: "https://www.google.com")!)
    ]
    
    @State var selectedTab = 0
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    //TextField("Search...", text: store.currentURL, onCommit: {
                    TextField("Search...", text: $url, onCommit: {
                        print(url)
                        
                        tabs[selectedTab].url = URL(string: url)!
                    })
                        .padding(10)
                        .modifier(ClearButton(text: $url))
                        .padding(.horizontal, 20)
                        .background(Color(.tertiarySystemFill))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .keyboardType(.webSearch)
                    
                    Button(action: {
                        tabs[selectedTab].webView.reload()
                    }, label: {
                        Image(systemName: "gobackward")
                            .font(.title2)
                    })
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<tabs.count) { index in
                        Button(action: { select(tabIndex: index) }) {
                            Text(tabs[index].url.absoluteString)
                        }
                    }
                }
            }
            
            Spacer()
            TabView(selection: $selectedTab) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    VStack {
                        Text("\(tabs[index].url.absoluteString)")
                        
                        WebView(
                            tab: tabs[index]
                        )
                        .tag(index)
                        .onReceive(tabs[index].$url) { newURL in
                            print("Receive: \(index): \(newURL)")
                            
                            if selectedTab == index {
                                url = newURL.absoluteString
                            }
                        }
                    }
                }
            }
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    tabs[selectedTab].webView.goBack()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                })
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "doc.on.doc")
                        .font(.title)
                })
                Spacer()
                Button(action: {
                    tabs[selectedTab].webView.goForward()
                }, label: {
                    Image(systemName: "arrow.forward")
                        .font(.title)
                })
                Spacer()
            }
        }
        .sheet(isPresented: $isPresented, content: {
            NavigationView {
                List {
                    ForEach(tabs) { tab in
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text(tab.url.absoluteString)
                                Spacer()
                                Button(action: {
                                    //delete tab
                                }, label: {
                                    Image(systemName: "xmark.circle")
                                        .foregroundColor(.red)
                                })
                            }
                        })
                    }
                }
                .navigationTitle("Tabs")
                .navigationBarItems(trailing:
                    Button(action: {
                        //add tab
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                    })
                )
            }
        })
    }
    
    func select(tabIndex: Int) {
        selectedTab = tabIndex
        url = tabs[tabIndex].url.absoluteString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
