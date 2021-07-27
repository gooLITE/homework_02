//
//  File.swift
//  homework_02
//
//  Created by Yu Sum Yung on 20/7/2021.
//

import Foundation

struct MovieData : Decodable{
    let title: String
    let releasedate: String
    let studio: String
    let poster: String
    let poster_2x: String
    let moviesite: String
    let location: String
    let rating: String
    let genre: [String]
    let directors: String
    let actors: [String]
    let trailers: [trailersStruct]
}

struct trailersStruct : Decodable{
    let postdate: String
    let url: String
    let type: String
    let exclusive: Bool
    let hd: Bool
}

struct MovieDetailData{
    var title = ""
}
