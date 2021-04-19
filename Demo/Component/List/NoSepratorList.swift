//
//  NoSepratorList.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 18/04/21.
//

import SwiftUI

struct NoSepratorList<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        
    }
        
    var body: some View {
        if #available(iOS 14.0, *) {
           ScrollView {
               LazyVStack(spacing: 0) {
                self.content()
             }
           }
        } else {
            List {
                self.content()
            }
            .onAppear {
               UITableView.appearance().separatorStyle = .none
            }.onDisappear {
               UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}
