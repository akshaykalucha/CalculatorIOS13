//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Akshay Kalucha on 16/02/22.
//

import SwiftUI
import Foundation

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
    @State var prevValue = 0
    @State var currentOperation: Operation = .none

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
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: buttonWidth(item: item),
                                        height: buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }

    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .add
                self.prevValue = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .subtract
                self.prevValue = Int(self.value) ?? 0
            }
            else if button == .multiply {
                dummyValue = self.value
                self.currentOperation = .multiply
                self.prevValue = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.logic = true
                dummyValue = self.value
                self.currentOperation = .divide
                self.prevValue = Int(self.value) ?? 0
            }
            else if button == .equal {
                let prevNumber = self.prevValue
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(prevNumber + currentValue)"
                case .subtract: self.value = "\(prevNumber - currentValue)"
                case .multiply: self.value = "\(prevNumber * currentValue)"
                case .divide: self.value = "\(prevNumber / currentValue)"
                case .none:
                    break
                }
            }

            if button != .equal {
                self.value = dummyValue
            }
        case .clear:
            self.value = "0"
            currentOperation = .none
            
        case .decimal, .inverse, .percent:
            if button == .inverse && self.value != "0" {
                self.value = "-\(self.value)"
            }
            else if button == .percent {
                if self.value != "0" {
                    let val1 = Int(self.value) ?? 0
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
            }
            else {
                if logic{
                    self.value = "\(number)"
                    logic = false
                }else{
                    self.value = "\(self.value)\(number)"
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
