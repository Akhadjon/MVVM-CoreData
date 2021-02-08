//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import UIKit

class ProfileViewController: UIViewController {

    
    //MARK:- Properities
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:10, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.width-2)/3, height: (view.frame.width-4)/3)
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: view.frame.height/3)
        return layout
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.frame = CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostViewCell.self, forCellWithReuseIdentifier: PostViewCell.identifier)
        collectionView.register(ProfileInfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeader.identifier)
     
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    

    //MARK: LifeCycle Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpViews()
        
    }
    

    //MARK: UISetup
    
    private func setUpViews(){
        view.backgroundColor = .yellow
        view.addSubview(collectionView)
       
    }
    
    

}




//MARK: Colelction View DataSource and Delegate Methods

extension ProfileViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 20
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostViewCell.identifier, for: indexPath) as! PostViewCell
            cell.mediaView.image = UIImage(named: "test.jpg")
            return cell
        
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeader.identifier, for: indexPath) as! ProfileInfoHeader
         return profileHeader
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       
        return CGSize(width:view.frame.width, height:300)
        
    }
     
    
  
}

