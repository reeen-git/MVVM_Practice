//
//  DetailViewModel.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/05.
//

import Foundation

class DetailViewModel {
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDiscription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDiscription = movie.overview ?? ""
        self.movieID = movie.id
        self.movieImage = makeImageUrl(movie.backdropPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
