//
//  Post.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import Foundation

struct PostData:Decodable{
    let posts:[Post]
}

struct Post :Decodable{
    var id:String?
    var author:String?
    var height:Int?
    var width:Int?
    var url :String?
    var download_url:String?
}
