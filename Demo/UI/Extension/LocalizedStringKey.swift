//
//  LocalizedStringKey.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

extension LocalizedStringKey {
    
    /// Return localized value of thisLocalizedStringKey
    public func toString() -> String {
        //use reflection
        let mirror = Mirror(reflecting: self)
        
        //try to find 'key' attribute value
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }
        
        if(attributeLabelAndValue != nil) {
            //ask for localization of found key via NSLocalizedString
            return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}
