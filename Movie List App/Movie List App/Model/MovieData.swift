//
//  MovieData.swift
//  Movie List App
//
//  Created by Admin on 22.12.2023.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    let poster: String
    let title: String
    let description: String
    let rating: Double
    let duration: DateComponents
    let genre: [String]
    let releasedDate: Date
    let trailerLink: URL?
    var isOnMyWatchList: Bool
    let id: Int
}
