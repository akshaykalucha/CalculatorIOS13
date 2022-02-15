//
//  ButtonView.swift
//  calcSwiftUI
//
//  Created by Akshay Kalucha on 15/02/22.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button("Show details") {
                showDetails.toggle()
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
