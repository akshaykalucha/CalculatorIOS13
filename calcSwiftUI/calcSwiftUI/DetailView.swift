//
//  DetailView.swift
//  calcSwiftUI
//
//  Created by Akshay Kalucha on 15/02/22.
//

import SwiftUI

struct DetailView: View {
    let heading: String
    var body: some View {
        VStack{
            NavigationView {
                NavigationLink(destination: ContentView(), label: {
                    Text(heading)
                })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(heading: "sjshs")
    }
}
