//
//  PostViewCell.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/8/21.
//
import UIKit

class PostViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    

    lazy var  mediaView:UIImageView = {
         let imageView = UIImageView()
         imageView.clipsToBounds = true
         imageView.contentMode = .scaleToFill
         return imageView
     }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mediaView)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mediaView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        mediaView.image = nil
    }
}
