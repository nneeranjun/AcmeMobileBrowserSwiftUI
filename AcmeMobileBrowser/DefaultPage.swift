//
//  DefaultPage.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/24/21.
//

import SwiftUI

struct DefaultPage: View {
    var body: some View {
        VStack {
            Text("Welcome to the Acme Mobile Browser")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Start searching now!")
                .font(.title2)
        }
    }
}

struct DefaultPage_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPage()
    }
}
