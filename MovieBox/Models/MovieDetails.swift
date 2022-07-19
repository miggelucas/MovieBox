//
//  MovieDetails.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import Foundation


struct MovieDetails : Codable {
    let runtime : Int
    let genres : [Genres]
    
    func formatedRuntime() -> String {
        return "\(self.runtime/60)h \(self.runtime%60) min"
    }
}


struct Genres : Codable {
    let id : Int
    let name : String
}
