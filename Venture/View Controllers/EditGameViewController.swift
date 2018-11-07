//
//  EditGameViewController.swift
//  Venture
//
//  Created by Tanner York on 11/2/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class EditGameViewController: UINavigationController {
    
    
    //MARK: Properties
    var imagePicker = UIImagePickerController()
    var text = ""
    var details = ""
    var rating: VideoGame.Rating = .E
    var genre: VideoGame.Genre = .Action
    var image = UIImage(named: "Blue")
    

    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameDetails: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let UITapRecognizer = UITapGestureRecognizer(target: self, action: "tappedImage")
        UITapRecognizer.delegate = (self as! UIGestureRecognizerDelegate)
        self.gameImage.addGestureRecognizer(UITapRecognizer)
        self.gameImage.isUserInteractionEnabled = true
    }
    
  
    
    
    //Mark: Actions
    @IBAction func finnishEdit(_ sender: Any) {
        
        
    }
    
    func finishEdit() {
        
    }
}


extension EditGameViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func tappedImage(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in})
        gameImage.image = image
    }
}
