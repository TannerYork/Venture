//
//  VideoGame.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class VideoGame: NSObject, NSCoding {
    
    
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(genre, forKey: "genre")
        aCoder.encode(rating, forKey: "rating")
        aCoder.encode(details, forKey: "details")
        aCoder.encode(availability, forKey: "availability")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
    
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

