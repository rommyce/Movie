//
//  HomeView.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Declare
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // MARK: - Init
    init() {
        viewModel.listMoview()
    }

    // MARK: - Views
    var body: some View {
        NavigationView{
            NoSepratorList() {
                ForEach(viewModel.movies) { movie in
                    VStack{
                        itemTitle(title: movie.title)
                        HStack{
                            if(movie.imageURL != nil){
                                itemImage(url: movie.imageURL!)
                            }
                            VStack{
                                itemDetail(detail: movie.overview)
                                
                                itemReleaseDate(date: movie.release_date)
                                
                                itemRate(rate: movie.vote_average ?? 0.0 )
                            }
                            .padding(10)
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                      )
                    .padding(10)
                    .background(Color.background)
                    .cornerRadius(CGFloat(values.radius))
                    .padding(10)
                    .animation(.easeInOut)
                    .transition(.move(edge: .bottom))
                    .onAppear{
                        if(movie == viewModel.movies.last){
                            viewModel.listMoview()
                        }
                    }
                }
            }
            .navigationBarTitle("list_movie", displayMode: .inline)
            .background(Color.item_background)
            .navigationBarColor(backgroundColor: UIColor(named: "primary"))
        }
    }
    
    fileprivate func itemTitle(title: String) -> some View {
        return Text(title)
            .fontWeight(.black)
            .font(.headline)
            .lineLimit(2)
    }
    
    fileprivate func itemDetail(detail: String) -> some View {
        return Text(detail)
            .fontWeight(.light)
            .font(.body)
            .lineLimit(5)
    }
    
    fileprivate func itemReleaseDate(date: String) -> Text {
        return Text(date)
            .fontWeight(.light)
            .font(.body)
    }
    
    fileprivate func itemRate(rate: Double) -> HStack<TupleView<(Image, Text)>> {
        return HStack{
            Image.star
            
            Text("\(rate.rounded(toPlaces: 2))")
                .fontWeight(.light)
                .font(.body)
        }
    }
    
    fileprivate func itemImage(url: URL?) -> some View {
        return AsyncImage(url: url!){
            Image.item_background
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: ImageMovie.width, height: ImageMovie.height, alignment: .center)
        .clipped()
        .cornerRadius(CGFloat(values.radius))
        .padding(10)
    }
}
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HomeView()
                .environment(\.colorScheme, .dark)
            HomeView()
                .environment(\.colorScheme, .light)
        }
    }
}
#endif
