//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {

    static let urlComponets = URLComponents(string: "https://api.themoviedb.org/")!
    

    
    static func popularMoviesAPI() async -> [Movie] {
        
        var components = Movie.urlComponets
        components.path = "/3/movie/popular"
        components.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        
        } catch {
            //print(error)
        }
        // se der erro no do, retorna uma lista vazia
        return []
    }
    
    
    static func nowPlayingAPI() async -> [Movie] {
        var components = Movie.urlComponets
        components.path = "/3/movie/now_playing"
        components.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        
        } catch {
            //print(error)
        }
        // se der erro no do, retorna uma lista vazia
        return []
    }
    
    static func upcomingAPI() async -> [Movie] {
        var components = Movie.urlComponets
        components.path = "/3/movie/upcoming"
        components.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        
        } catch {
            //print(error)
        }
        // se der erro no do, retorna uma lista vazia
        return []
        
    }
    
    static func trendingTodayAPI() async -> [Movie] {
        var components = Movie.urlComponets
        components.path = "/3/trending/movie/day"
        components.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        
        } catch {
            //print(error)
        }
        // se der erro no do, retorna uma lista vazia
        return []
        
    }
    
    static func trendingThisWeekAPI() async -> [Movie] {
        var components = Movie.urlComponets
        components.path = "/3/trending/movie/week"
        components.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            return movieResult.results
            
        
        } catch {
            //print(error)
        }
        // se der erro no do, retorna uma lista vazia
        return []
        
    }
    
    
    //MARK: - Download de imagens
    
    static func donwloadImageData(withPath : String) async -> Data {
        let urlString = "https://image.tmdb.org/t/p/w500\(withPath)"
        //let urlString =   "https://image.tmdb.org/t/p/w500/9Rj8l6gElLpRL7Kj17iZhrT5Zuw.jpg"
        let url : URL = URL(string: urlString)!
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            return data
        
        } catch {
            print(error)
        }
        
        return Data()
    }
    
    
    
    // MARK: - Recuperando a chave da API de um arquivo
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }

    static func jimCarryAPI() async -> [Movie] {
        var componets = Movie.urlComponets
        componets.path = "/3/search/person?query=jim+carrey"
        componets.queryItems = [
            URLQueryItem(name : "api_key", value : Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from : componets.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from : data)
            return movieResult.results
        } catch {
            print(error)
        }
        
        return []
    }











}

