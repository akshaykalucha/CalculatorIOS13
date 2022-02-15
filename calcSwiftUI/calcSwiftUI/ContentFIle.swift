//
//  ContentFIle.swift
//  calcSwiftUI
//
//  Created by Akshay Kalucha on 15/02/22.
//

import SwiftUI

struct Content {
    let imageName: String
    let heading: String
    let subHeading: String
}


struct contentList {
    static let myContwnt = [
        Content(imageName: "icon", heading: "My Orders History", subHeading: "Re-order now"),
        Content(imageName: "stats", heading: "My Stats", subHeading: "Lorem Ipsum lipsum generator."),
        Content(imageName: "maps", heading: "My Addresses", subHeading: "Add or remove an address"),
        Content(imageName: "card", heading: "Payments Settings", subHeading: "Manage your saved cards or upi"),
        Content(imageName: "settings", heading: "Settings", subHeading: "Manage your Settings"),
    ]
}
