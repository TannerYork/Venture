//
//  GameTableViewCell.swift
//  Venture
//
//  Created by Tanner York on 10/30/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(taskImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(ratingLabel)
        containerView.addSubview(genreLabel)
        self.contentView.addSubview(containerView)
        
        taskImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        taskImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        taskImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        taskImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.taskImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200
    }

    
    let taskImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Delicious", size: 20)
        label.textColor = .black
        label.backgroundColor = UIColor(red:0.02, green:0.22, blue:0.37, alpha:1.0)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Delicious", size: 20)
        label.textColor = .black
        label.backgroundColor = UIColor(red:0.02, green:0.22, blue:0.37, alpha:1.0)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Delicious", size: 20)
        label.textColor = .black
        label.backgroundColor = UIColor(red:0.02, green:0.22, blue:0.37, alpha:1.0)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let checkOutcheckInButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Delicious", size: 20)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Delicious", size: 20)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let DeleteButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Delicious", size: 20)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    var game:VideoGame? {
        didSet {
            guard let gameItem = game else {return}
            let title = gameItem.title
                titleLabel.text = title
            let rating = gameItem.rating
                ratingLabel.text = rating.get()
            let genre = gameItem.genre
                genreLabel.text = genre.get()
            
            
                
            
        }
    }
    
}
