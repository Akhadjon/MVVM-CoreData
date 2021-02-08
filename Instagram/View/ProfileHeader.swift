//
//  ProfileHeader.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/8/21.
//

import UIKit

class ProfileHeader: UICollectionReusableView {

    static let identifier = "ProfileHeader"
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var numberOfPosts: UILabel!
    
    @IBOutlet weak var numberOfFollowers: UILabel!
    
    @IBOutlet weak var numberOfFollowing: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        profileImage.layer.cornerRadius = profileImage.frame.width/2
       
    }
    
}
