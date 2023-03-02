//
//  NetworkConstant.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/02.
//

import Foundation

class NetworkConstant {
    static var shared = NetworkConstant()
    
    private init() {
        
    }
    
    var apiKey: String {
        get {
            return "81876567f326e0b4877cef1cd4392baf"
        }
    }
    
    var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
