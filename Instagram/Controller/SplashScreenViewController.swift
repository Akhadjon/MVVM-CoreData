//
//  ViewController.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import UIKit

class SplashScreenViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPosts()
    }

    
    private func loadPosts(){
        //fetch data from Server
        APIService.shared.getPosts{[weak self] result in
            CoreData.sharedInstance.saveDataOF(posts: result)
            self?.perform()
        }
    }
    
    
    func showAlertWith(title:String,message:String, style:UIAlertController.Style = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func perform(){
        let tab = createTabbar()
        tab.modalPresentationStyle = .fullScreen
        tab.modalTransitionStyle = .crossDissolve
        present(tab, animated: true, completion: nil)
    }
    
    
    
    func createTabbar()->UITabBarController {
           let tabbar = UITabBarController()
           tabbar.viewControllers = [UINavigationController(rootViewController:createPostsVC()), UINavigationController(rootViewController: createHomeVC())]
           return tabbar
       }
       
       func createHomeVC()->ProfileViewController {
           let vc = ProfileViewController()
           vc.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
           return vc
       }
       func createPostsVC()->PostsViewController {
           let vc = PostsViewController()
           vc.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
           return vc
       }

}

