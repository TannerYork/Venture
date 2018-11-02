//
//  AddGameViewController.swift
//  Venture
//
//  Created by Tanner York on 10/31/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    
    //MARK: Properties
    @IBOutlet weak var titleTextFeild: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var ratingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    

    
    //MARK: Actions
    @IBAction func addGame(_ sender: Any) {
        //Tries to add game to the library array
        trySaveingGame()
    }
    
    //Pops current view without adding a new game
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //Possible ratings for games
    let segments: [(title: String, rating: VideoGame.Rating)] =
        [("K", .K),
         ("E", .E),
         ("E10", .E10),
         ("T", .T),
         ("M", .M),
         ("A", .A),
         ("AO", .AO)]
    
    //Possible genres for the game
    let genres: [(title: String, genre: VideoGame.Genre)] =
    [(title: "Action", genre: .Action),
     (title: "Action-adventure", genre: .ActionAdventure),
     (title: "Adventure", genre: .Adventure),
     (title: "Role-playing", genre: .RolePlaying),
     (title: "Simulation", genre: .Simulation),
     (title: "Strategy", genre: .Strategy),
     (title: "Party", genre: .PartyGame),
     (title: "Logic", genre: .LogicGame),
     (title: "Trivia", genre: .TriviaGame),
     (title: "Board/Card", genre: .BoardGameOrCardGame)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Removes old segemnts on the ratingSegmentControl and adds new ones based on the ratings in the segments array
        ratingSegmentedControl.removeAllSegments()
        for (index, segment) in segments.enumerated() {
            ratingSegmentedControl.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        
        //Sets the data soure and delegate for the genrePickerView
        self.genrePickerView.dataSource = self
        self.genrePickerView.delegate = self
        
    }
    
    
    //Function for trying to add a new game and then pop the current view
    func trySaveingGame() {
        //Title
        guard let title = titleTextFeild.text, titleTextFeild.text != "" else {return}
        
        //Detials
        guard let details = detailsTextView.text, detailsTextView.text != "" else {return}
        
        //Rating
        let rating = segments[ratingSegmentedControl.selectedSegmentIndex].rating

        //Genre
        let genre = genres[genrePickerView.selectedRow(inComponent: 0)].genre
        
        let game = VideoGame(title: title, genre: genre, rating: rating, details: details)
        
        Library.sharedInstance.games.append(game)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension AddGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Sets number of options for the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    //Sets options for picker view with the elements in the genres array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
    
    //Recieves the needed data for the AddGameViewContoller for the picker view
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


