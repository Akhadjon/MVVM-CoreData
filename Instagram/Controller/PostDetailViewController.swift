//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/8/21.
//

import UIKit
import SnapKit
class PostDetailViewController: UIViewController {
   
    
    lazy var imageView:UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
       return imageView
    }()
    
    
    lazy var authorLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var sizerLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var urlLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    

    var viewModel: PostDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateUI()
    }
    
    
   
        private func updateUI() {
            imageView.setImageFromPath(viewModel.download_url )
            authorLabel.text = viewModel.author
            sizerLabel.text = String(viewModel.width!)+"x"+String(viewModel.height!)
            urlLabel.text = viewModel.url
            
        }
    
    
    
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(authorLabel)
        view.addSubview(sizerLabel)
        view.addSubview(urlLabel)
        
        let size = view.frame.width
        imageView.frame = CGRect(x: size * 0.05, y: size * 0.3, width: size * 0.9, height: size * 0.9)
        
        
        
        authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        sizerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.authorLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        urlLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sizerLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
        
        
    }
    

}

extension UIImageView {
    func setImageFromPath(_ path: String?) {
        image = nil
        DispatchQueue.global(qos: .background).async {
            var image: UIImage?
            guard let imagePath = path else {return}
            if let imageURL = URL(string: imagePath) {
                if let imageData = NSData(contentsOf: imageURL) {
                    image = UIImage(data: imageData as Data)
                } else {
                    // Image default - In case of error
                    image = UIImage(named: "noImageAvailable")
                }
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

