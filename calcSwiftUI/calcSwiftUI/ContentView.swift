//
//  ContentView.swift
//  calcSwiftUI
//
//  Created by Akshay Kalucha on 15/02/22.
//

import SwiftUI

struct ContentView: View {
    
    let contents: [Content] = contentList.myContwnt
    
    
    var body: some View {
        ScrollView{
            VStack{
                
                //Menu Bar
                HStack {
                    Button {
                        print("Image tapped!")
                    } label: {
                        Image("Close")
                            .padding(.trailing, 70)
                    }
                    Text("MY ACCOUNT")
                        .font(Font.custom("Gilroy-Bold", size: 20))
                        .padding(.trailing, 110)
                }
                
                
                // Profile Info
                HStack{
                    Image("myImg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 55)
                        .clipShape(Circle()).overlay(
                            Circle().stroke(Color.black, lineWidth: 2)
                        ).padding(.leading, 30)
                    VStack(alignment: .leading) {
                        Text("Akshay Kalucha")
                        Text("+91 98738-35100").font(Font.custom("EdmondsansBold_web", size: 14))
                    }.padding(.leading, 1).font(Font.custom("EdmondsansBold_web", size: 16))
                    Spacer()
                    Button {
                        print("Image tapped!")
                    } label: {
                        Image("edit")
                    }.padding(.trailing, 30)
                }
                
                // Totals revenue
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:382, height: 128)
                        .foregroundColor(Color(red: 52/255, green: 37/255, blue: 70/255))
                        .overlay(
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Totals Revenue")
                                        .font(Font.custom("Gilroy-Medium", size: 16))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                    Spacer()
                                        Text("Withdraw")
                                            .foregroundColor(Color(red: 252/255, green: 199/255, blue: 66/255))
                                }.padding(.bottom, 7)
                                Text("₹1523.05")
                                    .font(Font.custom("EdmondsansBold_web", size: 24))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                Text("All Transaction history")
                                    .font(Font.custom("Gilroy-Medium", size: 14))
                                    .padding(.top, 6)
                                    .foregroundColor(Color(red: 35/255, green: 208/255, blue: 135/255))
                                Line(x1: 0, x2: 140, y1: -6, y2: -6)
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                                    .frame(height: 1)
                                    .foregroundColor(Color(red: 35/255, green: 208/255, blue: 135/255))
                            }.padding()
                        )
                }.padding(.top, 20)
                
                //Toggle List View
                InfoView(imageName: "icon", heading: "My Orders History", subHeading: "Re-order now", dividerWidth: 370)
                InfoView(imageName: "stats", heading: "My Stats", subHeading: "Lorem Ipsum lipsum generator.", dividerWidth: 370)
                InfoView(imageName: "maps", heading: "My Addresses", subHeading: "Add or remove an address", dividerWidth: 370)
                InfoView(imageName: "card", heading: "Payments Settings", subHeading: "Manage your saved cards or upi", dividerWidth: 370)
                InfoView(imageName: "settings", heading: "Settings", subHeading: "Manage your Settings", dividerWidth: 370)
                
                
                // Scratch Cards
                VStack(alignment: .trailing){
                    HStack{
                        Text("Scratch Cards")
                            .padding(.leading, 20)
                        Spacer()
                        Text("Dots").padding(.trailing, 20)
                    }
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            ForEach(0..<20){ index in
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.cyan)
                                    .frame(width: 164, height: 218)
                            }
                        }.padding(.leading)
                    })
                }.padding(.top, 30)
                
                
                
                //Gifts & Rewards
                Group{
                    VStack{
                        InfoView(imageName: "gift", heading: "Gift Vouchers / Coupons", subHeading: "You've Earned 1,523.05 Points", dividerWidth: 0)
                    }
                    
                    // refer and earn
                    VStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(red: 255/255, green: 242/255, blue: 235/255))
                            .frame(height: 268)
                            .overlay(
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Refer a friends & Earn")
                                        Text("Give your friends 10% off on their first service from HYPD")
                                        Text("Copy your code XXXXXX")
                                        Button {
                                            print("Image tapped!")
                                        } label: {
                                                Text("Invite friends")
                                                .padding()
                                                .background(Color(red: 251/255, green: 108/255, blue: 35/255))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.black, lineWidth: 2)
                                                )
                                        }.cornerRadius(20)
                                    }
                                    Spacer()
                                    VStack{
                                        Image("panda")
                                    }
                                }
                            )
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Line: Shape {
    let x1: Int
    let x2: Int
    let y1: Int
    let y2: Int
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: x1, y: y1))
        path.addLine(to: CGPoint(x: x2, y: y2))
        return path
    }
}

struct InfoView: View {
    let imageName: String
    let heading: String
    let subHeading: String
    let dividerWidth: Int
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.leading)
            VStack(alignment: .leading, spacing: 3) {
                Text(heading)
                    .fontWeight(.bold)
                Text(subHeading)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image("arrow")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 15)
                .padding(.trailing, 18)
        }.padding(.top, 10)
        Divider().frame(maxWidth: CGFloat(dividerWidth))
    }
}
