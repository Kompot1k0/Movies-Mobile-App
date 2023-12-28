//
//  MovieCard.swift
//  Movie List App
//
//  Created by Admin on 22.12.2023.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    let year: Int
    let duration: String
    
    init(movie: Movie) {
        self.movie = movie
        
        self.year = Calendar.current.component(.year, from: movie.releasedDate)
        
        self.duration = String(describing: movie.duration)
    }
    
    var body: some View {
        VStack{
            HStack {
                HStack {
                    poster
                    VStack(alignment: .leading) {
                        titleAndYear
                        timeAndDate
                        onMyWatchList
                    }
                    .padding()
                }
                Spacer()
            }
            Divider()
        }
        .padding()
    }
    
    var poster: some View {
        Image(movie.poster)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .frame(width: 110, height: 200)
            .shadow(color: .gray, radius: 3, y: 4)
    }
    
    var titleAndYear: some View {
        Text("\(movie.title) (\(String(year)))")
            .font(.title3)
            .multilineTextAlignment(.leading)
            .bold()
            .foregroundColor(.black)
    }
    
    var timeAndDate: some View {
        let text1 = Text(formattedDuration(movie.duration))
        let text2 = Text(movie.genre.joined(separator: ", "))
        return Text("\(text1) - \(text2)")
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
    }
    
    var onMyWatchList: some View {
        let text: Text
        if movie.isOnMyWatchList {
            text = Text ("ON MY WATCHLIST")
        }
        else {
            text = Text("")
        }
        return text
            .padding(.top)
            .font(.footnote)
            .foregroundColor(.black)
    }
}

func formattedDuration(_ time: DateComponents) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute]
    formatter.unitsStyle = .abbreviated
    
    guard let formattedString = formatter.string(from: time) else {
        return ""
    }
    
    return formattedString
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: ListOfMovies.listOfMovies.first!)
        MovieCard(movie: ListOfMovies.listOfMovies.first(where: { $0.id == 1 })!)
    }
}
