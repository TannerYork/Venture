//
//  AddGameViewController.swift
//  Venture
//
//  Created by Tanner York on 10/31/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit
import Photos

class AddGameViewController: UIViewController {

    
    //MARK: Properties
    @IBOutlet weak var titleTextFeild: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var ratingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var imageButton: UIButton!
    var imagePicker = UIImagePickerController()
    var newImage: UIImage? = nil

    

    
    //MARK: Actions
    @IBAction func addGame(_ sender: Any) {
        //Tries to add game to the library array
        trySaveingGame()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
    }
    
    //Pops current view without adding a new game
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectImage(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            self.newImage = image
            self.saveImage(imageName: "\(self.newImage!)")
        }
    }

    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in})
        imageButton.setBackgroundImage(image, for: .normal)    }
    
    
    
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
        checkPermission()
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
        
        //Image
        guard let gameImage = newImage, newImage != nil else {return}
        print(newImage!)
        //Rating
        let rating = segments[ratingSegmentedControl.selectedSegmentIndex].rating

        //Genre
        let genre = genres[genrePickerView.selectedRow(inComponent: 0)].genre
        
        let game = VideoGame(title: title, genre: genre, rating: rating, details: details, image: gameImage)
        
        Library.sharedInstance.games.append(game)
        navigationController?.popViewController(animated: true)
    }
    
    //Checks if permision to use photots is true
    func checkPermission() {
        
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
            
        case .authorized: print("Access is granted by user")
            
        case .notDetermined:
            
            PHPhotoLibrary.requestAuthorization({ (newStatus) in print("status is \(newStatus)")
                if newStatus == PHAuthorizationStatus.authorized {  print("success") } })
            
        case .restricted:
            print("User do not have access to photo album.")
            
        case .denied:
            print("User has denied the permission.") } }
    
    //Saves image taken by user
    func saveImage(imageName: String){
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = newImage
        //get the PNG data for this image
        let data = image!.pngData()
        //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
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

