//
//  SpeakerTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/11/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

class SpeakerTableViewCell: UITableViewCell {

    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTwitterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        speakerTwitterLabel.textColor = UIColor.twitterBlue()
    }
    
    func configure(withSpeaker speaker: Speaker, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {
        
        ImageCache.sharedInstance.retrieveImage(forKey: speaker.image) { maybeImage in
            guard let image = maybeImage else {
                self.speakerImageView.image = UIImage.trySwiftDefaultImage
                return
            }
            self.speakerImageView.image = image
        }
        
        speakerNameLabel.text = speaker.name
        speakerTwitterLabel.text = "@\(speaker.twitter)"
        
        if selectionEnabled == false {
            selectionStyle = .None
        }
        
        if accessoryEnabled == false {
            accessoryType = .None
        }
    }
}
