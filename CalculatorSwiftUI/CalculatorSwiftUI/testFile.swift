//
//  testFile.swift
//  CalculatorSwiftUI
//
//  Created by Akshay Kalucha on 16/02/22.
//

import SwiftUI

struct testFile: View {

@State var array = [1,2,3,4,5]

var body: some View {
    ScrollView {
        ForEach(array, id: \.self) { num in
            Group {
            if num % 2 == 0 {
                Text("Even")
            } else {
                Text("Odd")
            }
            }
        }
    }
}
}

struct testFile_Previews: PreviewProvider {
    static var previews: some View {
        testFile()
    }
}
