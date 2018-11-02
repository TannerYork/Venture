//
//  PLaceholderDataAPI.swift
//  Venture
//
//  Created by Tanner York on 10/30/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation

//Placeholder data to be used while data base is not connected
class placeholderDataAPI {
    static func getGames() -> [VideoGame] {
        let games = [
            VideoGame(title: "Fortnight", genre: .Action, rating: .E, details: "Build, Fight, and be the last one stading."),
            VideoGame(title: "Minecraft", genre: .Adventure, rating: .E, details: "Build and survive the nights."),
            VideoGame(title: "Rainbow Six Seige", genre: .Action, rating: .T, details: "Secure or attack an objective by reinforing walls or breaking them down.")
        ]
        return games
    }
}
