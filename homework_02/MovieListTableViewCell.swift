//
//  MovieListTableViewCell.swift
//  homework_02
//
//  Created by Nicole on 6/7/2021.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var directorName: UILabel!
    @IBOutlet weak var dummyBg: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterImage.layer.cornerRadius = 10
        dummyBg.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
