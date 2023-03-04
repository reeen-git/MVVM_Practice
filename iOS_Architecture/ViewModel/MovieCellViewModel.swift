//
//  MovieCellViewModel.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/04.
//

import Foundation

class MovieCellViewModel {
    var title: String
    var date: String
    var rating: String
    var id: Int
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)"
        self.id = movie.id
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
