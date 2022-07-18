//
//  MovieResponse.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 15/07/22.
//

import Foundation

struct MoviesResponse : Codable {
    let results : [Movie]
}

struct SearchResponse : Codable {
    let profile_path : String?
    let adult : Bool
    let id : Int
    let knowmFor : OneOf
}

struct OneOf : Codable {
    let object : [Movie]
}
