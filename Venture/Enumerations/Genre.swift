//
//  Genre.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
enum Genre {
    case RPG
    case Action
    case Adventure
    
    
    func get() -> String {
        switch self {
        case .RPG:
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
