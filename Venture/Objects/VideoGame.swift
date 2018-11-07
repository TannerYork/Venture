//
//  VideoGame.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit

class VideoGame {

    //Possible options or a games genre
    enum Genre: String {
        case RolePlaying = "Role-playing"
        case Action = "Action"
        case ActionAdventure = "Action-adventure"
        case Adventure = "Adventure"
        case Simulation = "Simulation"
        case Strategy = "Strategy"
        case PartyGame = "Party"
        case LogicGame = "Locgic"
        case TriviaGame = "Triva"
        case BoardGameOrCardGame = "Board or Card"
    }

    //Options for the availibility of a game
    enum Availability {
        case checkedOut
        case checkedIn
       
    }

    //Options for the rating of a game
    enum Rating: String {
        case K = "K"
        case E = "E"
        case E10 = "E10"
        case T = "T"
        case M = "M"
        case A = "A"
        case AO = "AO"
    }

    //Properties
    var title: String
    var genre: Genre
    var rating: Rating
    var details: String
    var availability: Availability = .checkedIn
    var dueDate: Date? = nil
    var image: UIImage
    
    init(title: String, genre: Genre, rating: Rating, details: String, image: UIImage) {
        self.title = title
        self.genre = genre
        self.rating = rating
        self.details = details
        self.image = image
    }
    
    
//    //Encodes custom data to be saved on a database
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(title, forKey: "title")
//        aCoder.encode(genre, forKey: "genre")
//        aCoder.encode(rating, forKey: "rating")
//        aCoder.encode(details, forKey: "details")
//        aCoder.encode(availability, forKey: "availability")
//        aCoder.encode(dueDate, forKey: "dueDate")
//    }
//    
//    //Decodes encoded data for the data base
//    required convenience init?(coder aDecoder: NSCoder) {
//        let title = aDecoder.decodeObject(forKey: "title") as! String
//        let genre = aDecoder.decodeObject(forKey: "genre") as! Genre
//        let rating = aDecoder.decodeObject(forKey: "rating") as! Rating
//        let details = aDecoder.decodeObject(forKey: "details") as! String
//        let availability = aDecoder.decodeObject(forKey: "availability") as! Availability
//        let dueDate = aDecoder.decodeObject(forKey: "dueDate") as! Date?
//        self.init(title: title, genre: genre, rating: rating, details: details)
//    }

}
