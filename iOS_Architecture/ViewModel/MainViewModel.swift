//
//  MainViewModel.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/02.
//

import Foundation

class MainViewModel {
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData() {
        APICaller.getTrandingMovies { result in
            switch result {
            case .success(let data):
                print("success: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
