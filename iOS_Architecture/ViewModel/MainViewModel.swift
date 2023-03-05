//
//  MainViewModel.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/02.
//

import Foundation

class MainViewModel {
    var isLoading = Observable(false)
    var cellDataSource: Observable<[MovieCellViewModel]> = Observable(nil)
    var dataSource: TrandingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        APICaller.getTrandingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else { return nil }
        return movie
    }
}
