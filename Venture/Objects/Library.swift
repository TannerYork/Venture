//
//  Library.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class Library {
    static let sharedInstance = Library()
    
    var games = [VideoGame]()
    
    
    //Saves the games to a data base
    func saveGames() {
        let userDefaults = UserDefaults.standard
        let videoGameLibrary: [VideoGame] = []
        let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: videoGameLibrary, requiringSecureCoding: false)
        
        userDefaults.set(encodedData, forKey: "library")
    }
    //Needs to be changed for realms
    
    //Loads the games from the data base
     func loadGames() {
         let userDefaults = UserDefaults.standard
         guard let decoded = userDefaults.object(forKey: "library") as? Data else {
             return
        }
         let videoGameLibrary = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [VideoGame]
     }
    
}
