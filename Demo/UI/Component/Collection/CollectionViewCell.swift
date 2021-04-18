//
//  CollectionViewCell.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

struct CollectionViewCell: View {
      var index = 0
         init(row : Int , column : Int) {
             index =  row+column+(row*2)
         }
      var body: some View {
         
          ZStack{
              
              RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(width: cell.width, height: cell.width*1.5)
              Text("\(self.index)").foregroundColor(.white).font(.largeTitle)
              
          }.onTapGesture {
                  print("\(self.index)")
          }
        
      }
}

struct CollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewCell(row: 0, column: 1)
    }
}
