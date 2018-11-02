//
//  VideoGame.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation

class VideoGame: NSObject, NSCoding {

    //Possible options or a games genre
    enum Genre {
        case RolePlaying
        case Action
        case ActionAdventure
        case Adventure
        case Simulation
        case Strategy
        case PartyGame
        case LogicGame
        case TriviaGame
        case BoardGameOrCardGame
        
        
        //Gets a string based in the genre case
        func get() -> String {
            switch self {
            case .RolePlaying:
                return "RPG"
            case .Action:
                return "Action"
            case .Adventure:
                return "Adveture"
            default:
                return "Error"
            }
        }
    }

    //Options for the availibility of a game
    enum Availability {
        case checkedOut(dueDate: Date)
        case checkedIn
        
        init(dueDate: Date?) {
            if let date = dueDate {
                self = .checkedOut(dueDate: date)
            } else {
                self = .checkedIn
            }
        }
        
        
    }

    //Options for the rating of a game
    enum Rating {
        case K
        case E
        case E10
        case T
        case M
        case A
        case AO
        
        func get() -> String {
            switch self {
            case .K:
                return "K"
            case .E:
                return "E"
            case .E10:
                return "E10"
            case .T:
                return "T"
            case .M:
                return "M"
            case .A:
                return "A"
            case .AO:
                return "A0"
            default:
                return "Error"
            }
        }
    }

    
    
    
    
    //Properties
    var title: String
    var genre: Genre
    var rating: Rating
    var details: String
    var availability: Availability = .checkedIn
    var dueDate: Date? = nil
    
    init(title: String, genre: Genre, rating: Rating, details: String) {
        self.title = title
        self.genre = genre
        self.rating = rating
        self.details = details
    }
    
    
    //Encodes custom data to be saved on a database
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(genre, forKey: "genre")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(details, forKey: "details")
        aCoder.encode(availability, forKey: "availability")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
    
    //Decodes encoded data for the data base
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let genre = aDecoder.decodeObject(forKey: "genre") as! Genre
        let rating = aDecoder.decodeObject(forKey: "rating") as! Rating
        let details = aDecoder.decodeObject(forKey: "details") as! String
        let availability = aDecoder.decodeObject(forKey: "availability") as! Availability
        let dueDate = aDecoder.decodeObject(forKey: "dueDate") as! Date?
        self.init(title: title, genre: genre, rating: rating, details: details)
    }
}

