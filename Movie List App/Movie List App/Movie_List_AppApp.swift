//
//  Movie_List_AppApp.swift
//  Movie List App
//
//  Created by Admin on 21.12.2023.
//

import SwiftUI

@main
struct Movie_List_AppApp: App {
    private let app = MovieListViewModel()
    var body: some Scene {
        WindowGroup {
            MovieListContentView(app: app)
        }
    }
}
