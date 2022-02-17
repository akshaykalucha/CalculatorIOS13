//
//  CalcButton.swift
//  CalculatorSwiftUI
//
//  Created by Akshay Kalucha on 16/02/22.
//

import Foundation



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
