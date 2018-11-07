//
//  MainTableViewController.swift
//  Venture
//
//  Created by Tanner York on 10/29/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class LibraryViewConroller: UIViewController, UITableViewDataSource {
    
    
    let library = Library.sharedInstance
    //let testLibrary = placeholderDataAPI.getGames()
    @IBOutlet weak var gamesTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            
            let indexPath = self.gamesTableView!.indexPathsForSelectedRows!.first!
            let game = library.games[indexPath.row]
            let vc = segue.destination as! GameViewController
            vc.details = game.details
            vc.text = game.title
            vc.genre = game.genre.rawValue
            vc.rating = game.rating.rawValue
            vc.image = game.image
            vc.avalability = game.availability
        }
        
        //Sends the curretn data for the selected game(Find a way to get the endex for a cell when a button is presed)
        if segue.identifier == "SegueToEditMode" {
            let indexPath = self.gamesTableView!.indexPathsForSelectedRows!.first!
            let game = library.games[indexPath.row]
            let vc = segue.destination as! EditGameViewController
            vc.text = game.title
            vc.details = game.details
            vc.genre = game.genre
            vc.rating = game.rating
    }
    }
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
//        library.games.append(contentsOf: placeholderDataAPI.getGames())
        
        gamesTableView.emptyDataSetSource = self
        gamesTableView.emptyDataSetDelegate = self

        // A little trick for removing the cell separators
        gamesTableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gamesTableView.reloadData()
    }
    
    //MARK: Actions
    
    //Sets a games availibility to checkout and sets a date
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        game.availability = .checkedOut
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
    
    //Sets the data for each cell when loaded in
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        let game = library.games[indexPath.row]
        cell.setUp(game: game)

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
            self.gamesTableView.reloadData()
        }
        
        //Edit Game detials(This is currently not working so don't add it to the cell.
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { _, indexPath in
            //Find a way to get the index of the cell that is selected so that infomation can be changed correctly
            self.performSegue(withIdentifier: "SegueToEditMode", sender: self)
        }
        
        let game = library.games[indexPath.row]

        switch game.availability {
        case .checkedIn:
            // If the game is checked out, we create and return the check in action.
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                let dateFormatter = DateFormatter()
                let dueDate = Date(timeIntervalSinceNow: 604800)
                game.dueDate = dueDate
                self.checkOut(at: indexPath)
            }
            return [checkOutAction, deleteAction]
        case .checkedOut:
            // If the game is checked in, we create and return the check out action.
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
                game.dueDate = nil
            }
            return [checkInAction, deleteAction]
        }
    }
}


//If the table view is empty setup
extension LibraryViewConroller:  DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView?) -> UIImage? {
        return UIImage(named: "table")
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "Empty Library"
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "After you add some games you can keep up with when their due and who checked them out"
        
        var paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.paragraphStyle: paragraph]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView?, for state: UIControl.State) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        
        return NSAttributedString(string: "Add Game", attributes: attributes)
    }
    
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView?) -> UIColor? {
        return UIColor.white
    }
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView?) -> Bool {
        return true
    }
    
    func emptyDataSet(_ scrollView: UIScrollView?, didTap button: UIButton?) {
        self.performSegue(withIdentifier: "SegueToAddGame", sender: self)
    }
}

