//
//  ContentView.swift
//  Movie List App
//
//  Created by Admin on 21.12.2023.
//

import SwiftUI

struct MovieListContentView: View {
    
    @ObservedObject var app: MovieListViewModel
    @State private var showingConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer ()
                    sortButton
                }
                HStack {
                    headlineText
                    Spacer()
                }
                listOfMovies
            }
            .padding()
        }
    }
    
    var sortButton: some View {
        Button  {
            showingConfirmation = true
        } label: {
            Text("Sort")
                .foregroundColor(Color.black)
        }
            .confirmationDialog("", isPresented: $showingConfirmation) {
                Button("Title") {
                    app.sort(by: .title)
                }
                Button("Released date") {
                    app.sort(by: .releaseDate)
                }
            }
    }
    
    var headlineText: some View {
        Text("Movies")
            .font(.largeTitle)
            .bold()
    }

    
    var listOfMovies: some View {
        ScrollView(.vertical) {
            ForEach(app.listOfMovies) { movie in
                NavigationLink(
                    destination: MovieDetailsCard(movie: movie, app: app),
                    label: {
                        MovieCard(movie: movie)
                    })
            }.padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let app = MovieListViewModel()
        MovieListContentView(app: app)
    }
}
