//
//  PostsTableViewCell.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    //MARK: Properties
    
    private let cache = NSCache<NSNumber, UIImage>()
    private let utilityQueue =  DispatchQueue.global(qos: .utility)
    
    lazy var operationQueue :OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        queue.underlyingQueue = self.utilityQueue
        return queue
    }()
    
    
    private func loadImage(url:String, completion:@escaping (UIImage?)->() ){
        self.operationQueue.addOperation {
            let url = URL(string: url)!
            guard let data = try? Data(contentsOf: url) else {return}
            print(data)
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
  static let identifier = "postTableViewCell"
       
   private let author:UILabel = {
        let label = UILabel()
        return label
    }()
    
    
   private let  postImage:UIImageView = {
         let imageView = UIImageView()
         imageView.clipsToBounds = true
         imageView.contentMode = .scaleAspectFill
         return imageView
     }()
    
    //MARK: Setup Post values
    
    func setCellWithValuesOF(_ post:PostEntity){
        updateUI(author: post.author, postImageURL: post.download_url)
    }
    
    
    //MARK: Update UI views
    
    private func updateUI(author:String?, postImageURL:String?){
        self.author.text = author
        print("autghor: \(author)")
        print("imege:  \(postImageURL)")
        
        guard let urlString = postImageURL else {return}
        guard let url = URL(string: urlString) else {return}
        APIService.shared.getImageDataFrom(url: url) { [weak self] (data: Data) in
            print("image size:",data)
            if let image = UIImage(data: data) {
                self?.postImage.image = image
            } else {
                self?.postImage.image = UIImage(named: "noImageAvailable")
            }
        }
        
        

    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(postImage)
        contentView.addSubview(author)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func layoutSubviews() {
        super.layoutSubviews()
        postImage.frame =  contentView.bounds
        postImage.layer.cornerRadius = 10
       
    }
    
    override func prepareForReuse() {
       // postImage.image = nil
    }
    


}
