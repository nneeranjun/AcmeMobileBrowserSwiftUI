//
//  ErrorPage.swift
//  AcmeMobileBrowser
//
//  Created by Nilay Neeranjun on 3/25/21.
//

import SwiftUI

struct ErrorPage: View {
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon.fill")
                .font(.largeTitle)
            Text("Oops. The URL you entered is invalid. Please try a different one. ")
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding()
        }
    }
}

struct ErrorPage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorPage()
    }
}
