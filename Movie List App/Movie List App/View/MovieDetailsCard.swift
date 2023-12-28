//
//  MovieDetailsCard.swift
//  Movie List App
//
//  Created by Admin on 24.12.2023.
//

import SwiftUI

struct MovieDetailsCard: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var movie: Movie
    @ObservedObject var app: MovieListViewModel
    
    var body: some View {
        VStack{
            Divider()
            HStack(alignment: .top) {
                poster
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        title
                        Spacer()
                        rating
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    addRemoveToWatchlistButton
                    watchTrailerButton
                }
                
            }
            .padding(.bottom, 20)
            .padding(.top, 20)
            Divider()
            shortDescription
            Divider()
            details
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: returnButton)
    }
    
    var returnButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Movies")
            }
            .bold()
            .foregroundColor(.black)
        }
    }
    
    var details: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Details")
                    .bold()
                    .font(.title2)
                HStack(alignment: .center) {
                    VStack(alignment: .trailing) {
                        Group {
                            Text("Genre")
                            Text("Released date")
                        }.bold()
                    }
                    VStack(alignment: .leading) {
                        Group {
                            Text(movie.genre.joined(separator: ", "))
                            if let releasedDate = movie.releasedDate {
                                Text("\(formatReleasedDate(releasedDate))")
                            } else {
                                Text("No date")
                            }
                        }.foregroundColor(.gray)
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    private func formatReleasedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy, d MMMM"
        return formatter.string(from: date)
    }
    
    var shortDescription: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Short description")
                    .bold()
                    .font(.title2)
                Text(String(movie.description))
                    .foregroundColor(.gray)
            }
            .padding()
            Spacer()
        }
    }
    
    var watchTrailerButton: some View {
        
        var buttonBackGround: some View{
            Capsule()
                .fill(.white)
                .foregroundColor(.black)
                .frame(width: 200, height: 30)
                .overlay(
                    Capsule()
                        .stroke(.black, lineWidth: 2)
                ).padding(.vertical)
        }
        
        return Group {
            if let trailerLink = movie.trailerLink {
                Link(destination: trailerLink) {
                    ZStack {
                        buttonBackGround
                        Text("WATCH TRAILER")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            } else {
                ZStack {
                    buttonBackGround
                    Text("No link")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    var addRemoveToWatchlistButton: some View {
        Button(
            action: { app.addRemoveToWatchlist(movie) },
            label: {
            if !movie.isOnMyWatchList {
                Text("+ ADD TO WATCHLIST")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.6)
            }
            else {
                Text("REMOVE FROM WATCHLIST")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.6)
            }
        }).buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
    }
    
    var rating: some View {
        Text(String(movie.rating))
            .bold()
            .font(.title2)
        +
        Text("/10")
            .foregroundColor(.gray)
            .font(.title3)
    }
    
    var title: some View {
        Text(movie.title)
            .bold()
            .font(.title2)
            .lineLimit(4)
    }
    
    var poster: some View {
        VStack {
            Image(movie.poster)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(width: 140, height: 220)
                .shadow(color: .gray, radius: 3, y: 4)
        }
    }
    
    var onMyWatchList: some View {
        let text: Text
        if !movie.isOnMyWatchList {
            text = Text ("ON MY WATCHLIST")
        }
        else {
            text = Text("")
        }
        return text.padding(.top).font(.footnote)
    }
}

struct MovieDetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        let app = MovieListViewModel()
        MovieDetailsCard(movie: ListOfMovies.listOfMovies.first!, app: app)
        MovieDetailsCard(movie: ListOfMovies.listOfMovies.first(where: { $0.id == 1 })!, app: app)
    }
}
