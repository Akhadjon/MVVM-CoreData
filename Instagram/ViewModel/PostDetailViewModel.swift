//
//  PostDetailViewModel.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/8/21.
//

import Foundation


class PostDetailViewModel{
    let postDetails: PostEntity?
    let id:String?
    let author:String?
    let height:Int?
    let width:Int?
    let url :String?
    let download_url:String?
    
    init(postDetails: PostEntity?) {
        self.postDetails = postDetails
        
        self.author = postDetails?.author
        self.id = postDetails?.id
        self.height = Int(truncatingIfNeeded: postDetails!.height)
        self.width = Int(truncatingIfNeeded: postDetails!.width)
        self.url = postDetails?.url
        self.download_url = postDetails?.download_url
    }
    
   
}
