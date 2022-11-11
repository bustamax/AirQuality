//
//  Color.swift
//  Air Quality
//
//  Created by Максим Юрисов on 10.11.2022.
//

import UIKit

enum Colors{
    
    static var twenty = UIColor(hexString: "#00bfaf")
    static var forty = UIColor(hexString: "#01dddd")
    static var sixty = UIColor(hexString: "#e0e300")
    static var eighty = UIColor(hexString: "#fd8a5e")
    static var onehundred = UIColor(hexString: "#e64b4b")
    static var twohundred = UIColor(hexString: "#960505")
    
    static var background = UIColor(hexString: "#deeefd")
    static var backgroundtap = UIColor(hexString: "#cde7ff")
}


func returncolor(ppmLevel: Int)->UIColor{
    switch ppmLevel {
    case ...20:
        return Colors.twenty
    case 20...40:
        return Colors.forty
    case 40...60:
        return Colors.sixty
    case 60...80:
        return Colors.eighty
    case 80...100:
        return Colors.onehundred
    case 100...:
        return Colors.twohundred
    default:
        return Colors.twenty
    }
  
}
