//
//  PostListViewModel.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import Foundation
import UIKit
import CoreData

protocol UpdateTabeleViewDelegate:NSObjectProtocol {
    func reloadData(sender:PostListViewModel)
}

class PostListViewModel:NSObject, NSFetchedResultsControllerDelegate{
    
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    private var fetchedResultController:NSFetchedResultsController<PostEntity>?
    weak var delegate:UpdateTabeleViewDelegate?
    
    
    func retriveDataFromCoreData(){
        if let context = self.container?.viewContext{
            let request:NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: #keyPath(PostEntity.height), ascending: false)]
            self.fetchedResultController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext:context ,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            fetchedResultController?.delegate = self
            do{
                try self.fetchedResultController?.performFetch()
            }catch{
                print("Failed to initialize fetched result \(error.localizedDescription)")
            }
        }
    }
    
    //Notify tableView with chnages
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.delegate?.reloadData(sender: self)
    }
    
    //MARK:TableView DataSource functions
    
    func numberOfRowsInSection(section:Int)->Int{
        return fetchedResultController?.sections?[section].numberOfObjects ?? 0
    }
    
    func object(indexPath:IndexPath)->PostEntity?{
        return fetchedResultController?.object(at: indexPath)
    }
}
