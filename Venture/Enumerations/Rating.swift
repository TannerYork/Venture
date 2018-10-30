//
//  Rating.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
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
