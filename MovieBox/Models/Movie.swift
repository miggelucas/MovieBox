//
//  Filme.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 12/07/22.
//

import Foundation
import UIKit


// criando objeto para manipular os dados dos filme
struct Movie {
    // nome do filme
    let title : String
    // imagem do poster
    let poster : String
    // imagem de backdrop
    let backdrop : String
    // nota do filme
    let voteAverage : Float
    // data de lançamento
    let releaseDate : String
    // Descrição
    let overview : String
    // gêneros
    let genres : [String]
}
