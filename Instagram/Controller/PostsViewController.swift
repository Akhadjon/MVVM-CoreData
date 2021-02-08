//
//  PostsViewController.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import UIKit

class PostsViewController: UIViewController ,UpdateTabeleViewDelegate{
   
    
    //MARK:Properties
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.identifier)
        table.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        table.tableFooterView = UIView()
        return table
    }()
    
    
    private var viewModel = PostListViewModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        loadData()
       
    }
    
    
    private func loadData(){
        viewModel.retriveDataFromCoreData()
    }
    
    func reloadData(sender: PostListViewModel) {
        self.tableView.reloadData()
    }
    
}


extension PostsViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as! PostsTableViewCell
        let object = viewModel.object(indexPath: indexPath)

            if let post = object {
                cell.setCellWithValuesOF(post)
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PostDetailViewController()
        let selectedPost = viewModel.object(indexPath: indexPath)
        detailVC.viewModel = PostDetailViewModel(postDetails: selectedPost)
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    
}
