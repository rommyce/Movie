//
//  HomeView.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

struct HomeView: View {
    
    var movies: [Movie] = [Movie(dummy: true),
                           Movie(dummy: true),
                           Movie(dummy: true),
                           Movie(dummy: true),
                           Movie(dummy: true)]
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<cell.row){ i in
                    HStack(alignment: .center, spacing: cell.spacing){
                        ForEach(0..<cell.column){ j in
                            CollectionViewCell(row: i, column: j)
                        }
                        
                    }
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                }
            }
            .navigationBarTitle("list_movie", displayMode: .inline)
            .navigationBarColor(.orange)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
