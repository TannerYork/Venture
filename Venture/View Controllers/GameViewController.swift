//
//  GameViewController.swift
//  Venture
//
//  Created by Tanner York on 11/1/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {


    
    //MARK: Properties
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameDetails: UITextView! {
        didSet {
            gameDetails.font = UIFont(name: "Delicious", size: 17.0)
        }
    }
    


    //Placeholder values for the elements in the view
    var text = String()
    var image: UIImage? = nil
    var details = String()
    var genre = String()
    var rating = String()
    var avalability: VideoGame.Availability = .checkedIn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if image != nil {
            gameImage.image = image
        } else {
            gameImage.image = UIImage(named: "white")
        }
        gameTitle.text = text
        gameDetails.text =
        """
        Genre: \(genre)
        
        Rating: \(rating)
        
        Discription: \(details)
        """
        
    
        
    }
    
    
    
    //MARK: Actions
    
    @IBAction func checkOut(_ sender: Any) {
        //Sets games availibility to checked out and adds a date to be returned
        
    }
    
    

  
   

}
