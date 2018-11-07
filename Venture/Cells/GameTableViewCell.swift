//
//  GameTableViewCell.swift
//  Venture
//
//  Created by Tanner York on 10/30/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    //Placeholder data for the details fot the game
    var details = ""
    var date: Date? = nil
    
    //@IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var genreLable: UILabel!
    @IBOutlet weak var availibilityLable: UILabel! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Sets up the cell with the date received form the game peramiter
    func setUp(game: VideoGame) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"

        titleLable.text = game.title
        genreLable.text = game.genre.rawValue
        ratingLable.text = game.rating.rawValue
        details = game.details
        
        switch game.availability {
        case .checkedIn:
            availibilityLable.text = "Availible"
            availibilityLable.backgroundColor = UIColor(red:0.22, green:0.52, blue:0.06, alpha:1.0)
        case .checkedOut:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            if game.dueDate != nil {
                availibilityLable.text = "\(dateFormatter.string(from: game.dueDate!))"
            } else {
                availibilityLable.text = "Not Availible"
            }
            availibilityLable.backgroundColor = .red
        default:
            return
        }
    }
}
