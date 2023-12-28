//
//  MovieListModel.swift
//  Movie List App
//
//  Created by Admin on 21.12.2023.
//

import Foundation
import SwiftUI

struct MovieList {
    
    var listOfMovies: [Movie] = ListOfMovies.listOfMovies
    
    mutating func addRemoveToWatchlist(_ movie: Movie) {
        if let index = listOfMovies.firstIndex(where: { $0.id == movie.id }) {
            listOfMovies[index].isOnMyWatchList.toggle()
        }
    }
    mutating func sortMovies(by type: SortBy) {
        switch type {
        case .title:
            listOfMovies.sort { $0.title < $1.title}
        case .releaseDate:
            listOfMovies.sort { $0.releasedDate > $1.releasedDate }
        }
    }
}


