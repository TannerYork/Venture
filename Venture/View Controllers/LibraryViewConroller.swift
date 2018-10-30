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
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
       

        gamesTableView.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
        
        
    }
}

extension LibraryViewConroller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testLibrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        cell.game = testLibrary[indexPath.row]
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
