//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/8/21.
//

import UIKit
import SnapKit

class ProfileInfoHeader: UICollectionReusableView {
     
   
    static let identifier = "ProfileInfoHeader"
    
    private let profilePhotoImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "me.jpg")
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    private let postsButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Posts", for: .normal)
        return button
    }()
    
    private let followingButton:UIButton = {
        let button = UIButton()
         button.backgroundColor = .secondarySystemBackground
         button.setTitleColor(.label, for: .normal)
        button.setTitle("Following", for: .normal)
        return button
    }()
    
    private let followersButton:UIButton = {
        let button = UIButton()
         button.backgroundColor = .secondarySystemBackground
         button.setTitleColor(.label, for: .normal)
        button.setTitle("Followers", for: .normal)
        return button
    }()
    
    private let editProfileButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Edit Profile", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Joe Smith"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabe:UILabel = {
        let label = UILabel()
        label.text = """
        This is First Account
        Inha university
        Gaming
        footbal
        """
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addbuttonActions()
       
        clipsToBounds = true
    }
    
    private func  addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(postsButton)
        addSubview(nameLabel)
        addSubview(bioLabe)
        addSubview(editProfileButton)
    }
    
    func addbuttonActions(){
        followersButton.addTarget( self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget( self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget( self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget( self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = with/4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize/2
        let countbuttonWidth = (with - 10 - profilePhotoSize)/3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countbuttonWidth, height: buttonHeight).integral
        followersButton.frame = CGRect(x: postsButton.right, y: 5, width: countbuttonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followersButton.right, y: 5, width: countbuttonWidth, height: buttonHeight).integral
    
        nameLabel.frame = CGRect(x: 5, y: 5 + profilePhotoImageView.bottom , width: with-10, height:50).integral
        let bioLabelSize = bioLabe.sizeThatFits(self.frame.size)
        bioLabe.frame = CGRect(x: 5, y: 5 + nameLabel.bottom , width: with-10, height:bioLabelSize.height).integral
      

        editProfileButton.frame = CGRect(x: 10, y: bioLabe.bottom + 5, width: with - 20, height: 40)
    }
    
    
    //MARK:-Actions
    
    @objc func didTapFollowersButton(){
       
    }
    
    @objc func didTapFollowingButton(){
        
    }
    
    @objc func didTapPostsButton(){
     
    }
    
    @objc func didTapEditProfileButton(){
      
    }
    
    
}
