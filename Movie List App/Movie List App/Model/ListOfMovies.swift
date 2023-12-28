//
//  ListOfMovies.swift
//  Movie List App
//
//  Created by Admin on 22.12.2023.
//

import Foundation
import SwiftUI

struct ListOfMovies {
    static var listOfMovies: [Movie] = [
        Movie(poster: "Avengers",
              title: "Avengers: Age of Ultron",
              description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
              rating: 7.3,
              duration: DateComponents(hour: 2, minute: 21),
              genre: ["Action", "Adventure", "Sci-Fi"],
              releasedDate: {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "d MMM yyyy"
                  return dateFormatter.date(from: "1 May 2015") ?? Date(timeIntervalSince1970: 0)
              }(),
              trailerLink: URL(string: "https://www.youtube.com/watch?v=tmeOjFno6Do"),
              isOnMyWatchList: false,
              id: 0),
        
        Movie(poster: "Tenet",
              title: "Tenet",
              description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
              rating: 7.8,
              duration: DateComponents(hour: 2, minute: 30),
              genre: ["Action", "Sci-Fi"],
              releasedDate: {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "d MMM yyyy"
                  return dateFormatter.date(from: "3 September 2020") ?? Date(timeIntervalSince1970: 0)
              }(),
              trailerLink: URL(string: "https://www.youtube.com/watch?v=LdOM0x0XDMo"),
              isOnMyWatchList: false,
              id: 1),
        
        Movie(poster: "Spider Man",
              title: "Spider-Man: Into the Spider-Verse",
              description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
              rating: 8.4,
              duration: DateComponents(hour: 1, minute: 57),
              genre: ["Action", "Animation", "Adventure"],
              releasedDate: {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "d MMM yyyy"
                  return dateFormatter.date(from: "14 December 2018") ?? Date(timeIntervalSince1970: 0)
              }(),
              trailerLink: URL(string: "https://www.youtube.com/watch?v=tg52up16eq0"),
              isOnMyWatchList: false, id: 2),
        
        Movie(poster: "Knives Out",
              title: "Knives Out",
              description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
              rating: 7.9,
              duration: DateComponents(hour: 2, minute: 10),
              genre: ["Comedy", "Crime", "Drama"],
              releasedDate: {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "d MMM yyyy"
                  return dateFormatter.date(from: "27 November 2019") ?? Date(timeIntervalSince1970: 0)
              }(),
              trailerLink: URL(string: "https://www.youtube.com/watch?v=qGqiHJTsRkQ"),
              isOnMyWatchList: false, id: 3),
        
        Movie(poster: "Guardians of The Galaxy",
              title: "Guardians of the Galaxy",
              description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
              rating: 8.0,
              duration: DateComponents(hour: 2, minute: 1),
              genre: ["Action", "Adventure", "Comedy"],
              releasedDate: {
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "d MMM yyyy"
                  return dateFormatter.date(from: "1 August 2014") ?? Date(timeIntervalSince1970: 0)
              }(),
              trailerLink: URL(string: "https://www.youtube.com/watch?v=d96cjJhvlMA"),
              isOnMyWatchList: false, id: 4)
    ]
}
