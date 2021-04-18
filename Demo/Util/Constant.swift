//
//  Constant.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation
import SwiftUI

let RADIUS_STAND = 20
let TEXTFIELD_HEIGHT_STAND = 40

struct cell {
    static let column = 3
    static let row   = 9
    static let padding : CGFloat = 20
    static let spacing : CGFloat = 20
    static  let width = (UIScreen.main.bounds.width/CGFloat(column))-padding
}
