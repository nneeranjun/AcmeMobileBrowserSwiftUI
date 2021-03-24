//
//  SearchBar.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/23/21.
//

import SwiftUI

struct SearchBar: View {

    @State var text: String
    
    var body: some View {
        TextField("Search...", text: $text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.tertiarySystemFill))
            .cornerRadius(8)
            .padding(.horizontal, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: "")
    }
}
