//
//  CoreData.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import UIKit
import CoreData


class CoreData{
    static let sharedInstance = CoreData()
    private init(){}
    
    private let container:NSPersistentContainer?=(UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private let fetchRequest = NSFetchRequest<PostEntity>(entityName: "PostEntity")
    
    
    func saveDataOF(posts:[Post]){
        self.container?.performBackgroundTask({ [weak self] (context) in
            self?.deleteObjectsFromCoreData(context: context)
            self?.saveDatazToCoreData(posts: posts, context: context)
        })
    }
     
    
    
    //MARK: Clean up Core data obejcts before saving new data
    private func deleteObjectsFromCoreData(context:NSManagedObjectContext){
        do {
            let objects = try context.fetch(fetchRequest)
            _ = objects.map({context.delete($0)})
            try context.save()
        }catch{
           print("Deleting error \(error)")
        }
    }
    
    
    //MARK: Save network data to core data
    private func saveDatazToCoreData(posts:[Post], context:NSManagedObjectContext){
        context.perform {
            
            print("Are we in main thread \(String(describing: Thread.isMainThread))")
            for post in posts {
                let postEntity = PostEntity(context: context)
                postEntity.author = post.author
                postEntity.width = Int64( post.width!)
                postEntity.height = Int64( post.height!)
                postEntity.url = post.url
                postEntity.id = post.id
                postEntity.download_url = post.download_url
            }
            
            do{
                try context.save()
            }catch{
                fatalError("Failed to save core data")
            }
        }
    }
}
