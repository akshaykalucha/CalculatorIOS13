//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Akshay Kalucha on 16/02/22.
//

import SwiftUI
import Foundation


struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

func checkDot(val: String) -> Bool {
    for chr in val {
        if chr == "."{
            return false
        }
    }
    return true
}

func getVal(value: String) -> String {
    if value == "0.0"{
        print("yes", value)
        return value
    }
    let value = Array(value)
    if value.count >= 3{
        let last = value[value.count-1]
        let sLast = value[value.count-2]
        if last == "0" && sLast == "." {
            return (String(value[0..<value.count-2]))
        }
//        }else{
//            if value.count >= 6{
//                if value[0] == "-"{
//                    return String(value[0...value.count])
//                }
//                return String(value[0...value.count])
//            }
//            return String(value)
//        }
    }
    return String(value)
}

extension FloatingPoint {
    var isWholeNumber: Bool { isNormal ? self == rounded() : isZero }
}

extension String  {
    var isnumberordouble: Bool { return Double(self) != nil }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}


func buttonWidth(item: CalcButton) -> CGFloat {
    if item == .zero {
        return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
    }
    return (UIScreen.main.bounds.width - (5*12)) / 4
}

func buttonHeight() -> CGFloat {
    return (UIScreen.main.bounds.width - (5*12)) / 4
}

enum CalcButton: String {
    case one = "1", two="2", three="3", four="4", five="5", six="6", seven="7", eight="8", nine="9", zero="0", add="+", subtract="-", multiply="x", divide="/", equal="=", clear="AC", decimal=".", percent="%", inverse="+/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .inverse, .percent:
            return Color(.lightGray)
        
        default:
            return Color(UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {

    @State var value = "0"
    @State var dummyValue = "0"
    @State var logic = false
    @State var prevValue = 0.0
    @State var currentOperation: Operation = .none
    @State var eqDone = false

    let buttons: [[CalcButton]] = [
        [.clear, .inverse, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(value)
                        
                        .font(.system(size: 50, weight: .light))
                        .foregroundColor(.white)
                }
                .padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                if item.rawValue != "0"{
                                    Text(item.rawValue)
                                        .font(.system(size: 40))
                                        .frame(
                                            width: buttonWidth(item: item),
                                            height: buttonHeight()
                                        )
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(buttonWidth(item: item)/2)
                                }else{
                                    Text("0")
                                        .font(.system(size: 40))
                                        .frame(
                                            width: buttonWidth(item: item),
                                            height: buttonHeight()
                                        )
                                        .offset(x:-45)
                                        .background(item.buttonColor)
                                        .foregroundColor(.white)
                                        .cornerRadius(buttonWidth(item: item)/2)
                                }

                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }.padding(.bottom, 30)
        }
    }

    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .add
                self.prevValue = Double(self.value) ?? 0.0
            }
            else if button == .subtract {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .subtract
                self.prevValue = Double(self.value) ?? 0.0
            }
            else if button == .multiply {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .multiply
                self.prevValue = Double(self.value) ?? 0.0
            }
            else if button == .divide {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .divide
                self.prevValue = Double(self.value) ?? 0.0
            }
            else if button == .equal {
                eqDone = true
                self.logic = false
                let prevNumber = self.prevValue
                let currentValue = Double(self.value) ?? 0.0
                switch self.currentOperation {
                case .add: self.value = getVal(value: "\(Double(prevNumber) + Double(currentValue))")
                    
                case .subtract: self.value = getVal(value: "\(Double(prevNumber) - Double(currentValue))")
                    
                case .multiply: self.value = getVal(value: "\(Double(prevNumber) * Double(currentValue))")
                case .divide:
                    if currentValue == 0{
                        self.value = "NaN"
                    } else {
                        if Int(prevNumber) % Int(currentValue) == 0{
                            self.value = getVal(value: "\(Double(prevNumber) / Double(currentValue))")
                        }else{
                            self.value = getVal(value: "\(Double(prevNumber) / Double(currentValue))")
                        }
                    }
                    
                case .none:
                    break
                }
                self.prevValue = 0
                currentOperation = .none
            }

            if button != .equal {
                self.value = dummyValue
            }
        case .clear:
            self.value = "0"
            self.logic = false
            eqDone = false
            currentOperation = .none
            
        case .decimal, .inverse, .percent:
            
            if button == .decimal {
                if eqDone {
                    self.value = "0."
                } else{
                    if self.value == "0"{
                        self.value = "0."
                    }else if self.value != "0"{
                        if checkDot(val: self.value){
                            self.value = "\(self.value)."
                        }else{
                            self.value = "\(self.value)"
                        }
                    }
                }
            }
            
            if button == .inverse && self.value != "0" {
                let carr = Array(self.value)
                if carr[0] == "-" {
//                    self.logic = true
                    self.value = String(carr[1..<carr.count])
                }else{
//                    self.logic = true
                    self.value = "-\(self.value)"
                }

            }
            else if button == .percent {
                self.logic = true
                if self.value != "0" {
                    let val1 = Double(self.value) ?? 0.0
                    print(val1)
                    self.value = "\(Double(val1)/100.0)"
                }
            }
            
            else{
                break
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else if self.value == "0."{
                print(number)
                self.value = "\(self.value)\(number)"
            }
            else {
                if logic{
                    self.value = "\(number)"
                    logic = false
                    eqDone = false
                }else{
                    if eqDone{
                        self.value = "\(number)"
                        eqDone = false
                        currentOperation = .none
                    } else{
                        self.value = "\(self.value)\(number)"
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
