//
//  Toolbar.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/24/21.
//

import SwiftUI

struct ToolBar: View {
    
    @State var url: String
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
            SearchBar(text: url)
            Image(systemName: "gobackward")
        }
        .padding(.horizontal, 10)
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        ToolBar(url: "")
    }
}
