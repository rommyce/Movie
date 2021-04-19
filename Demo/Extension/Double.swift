//
//  Double.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 18/04/21.
//


import SwiftUI

extension Double {
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> String {
        return String(format:"%.\(places)f", self)
    }
}
