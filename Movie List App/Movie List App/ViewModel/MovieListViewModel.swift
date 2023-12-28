//
//  MovieListViewModel.swift
//  Movie List App
//
//  Created by Admin on 21.12.2023.
//

import Foundation
import SwiftUI

enum SortBy {
    case title
    case releaseDate
}

class MovieListViewModel: ObservableObject {
    
    @Published private var model = MovieList()
    
    var listOfMovies: [Movie] {
        model.listOfMovies
    }
    
    func addRemoveToWatchlist(_ movie: Movie) {
        model.addRemoveToWatchlist(movie)
    }
    
    func sort(by type: SortBy) {
        model.sortMovies(by: type)
    }
}
