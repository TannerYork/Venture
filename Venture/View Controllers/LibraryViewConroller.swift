//
//  MainTableViewController.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class LibraryViewConroller: UIViewController, UITableViewDataSource {
    
    let library = Library.sharedInstance
    let testLibrary = placeholderDataAPI.getGames()
    @IBOutlet weak var gamesTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            
            let indexPath = self.gamesTableView!.indexPathsForSelectedRows!.first!
            let game = library.games[indexPath.row]
            let vc = segue.destination as! GameViewController
            vc.details = game.details
            vc.text = game.title
            vc.genre = game.genre.get()
            vc.rating = game.rating.get()
            
        }
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        library.games.append(contentsOf: placeholderDataAPI.getGames())
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gamesTableView.reloadData()
    }
    
    //MARK: Actions
    
    //Sets a games availibility to checkout and sets a date
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.availability = .checkedOut(dueDate: dueDate)
        (gamesTableView.cellForRow(at: indexPath) as! GameTableViewCell).setUp(game: game)
    }
    
    //Sets a games availibility to checkedin
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.availability = .checkedIn
        (gamesTableView.cellForRow(at: indexPath) as! GameTableViewCell).setUp(game: game)
    }
    
    
    
}

extension LibraryViewConroller: UITableViewDelegate {
    
    //Sets the number of cells based in the number of games in the library
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    //Sets the date for each cell when loaded in
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        let game = library.games[indexPath.row]
        cell.setUp(game: game)
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let gameViewConroller = segue.destination as! GameViewController
            
            gameViewConroller.gameTitle.text = cell.titleLable.text!
            gameViewConroller.gameDetails.text = cell.details
    
            
        }
        
        
        return cell    }
    
    //Sets the cells expected height
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    

    //Adds actions to the cell when user slides to the left on a cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        
        let game = library.games[indexPath.row]
        
        

        switch game.availability {
        case .checkedIn:
            // If the game is checked out, we create and return the check in action.
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                
                self.checkOut(at: indexPath)
                
            }
            
            return [checkOutAction, deleteAction]
            
        case .checkedOut:
            // If the game is checked in, we create and return the check out action.
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
            }
            
            return [checkInAction, deleteAction]
            
        }
    }
}

