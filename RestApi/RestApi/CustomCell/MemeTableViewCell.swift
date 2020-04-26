//
//  MemeTableViewCell.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import Kingfisher

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(meme:Meme){
        memeImageView.kf.indicatorType = .activity
        if let imageURL = URL(string: meme.image){
            let processor = DownsamplingImageProcessor(size:memeImageView.frame.size)
            let placeHolderImage = R.image.default()
            memeImageView.kf.setImage(with: imageURL,placeholder:placeHolderImage )
        }
        topTitleLabel.text = meme.topText
        bottomTitleLabel.text = meme.bottomText
    }
    
}
