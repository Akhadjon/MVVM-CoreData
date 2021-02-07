//
//  APIService.swift
//  Instagram
//
//  Created by Akhadjon Abdukhalilov on 2/7/21.
//

import Foundation


class APIService{
    
    
    static let shared = APIService()
    
    
    private var dataTask:URLSessionDataTask?
    
    
    func getPosts(completion:@escaping ([Post])->Void){
        
        let postUrl = "https://picsum.photos/v2/list?page=2&limit=5"
        guard let url = URL(string:postUrl ) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("DataTask error:\(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Empty responce")
                return
            }
            print("Response Status code: \(response.statusCode)")
            guard let data = data else {
                print("Empty data")
                return
            }
            do{
                let posts =  try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            }catch let error{
                print("Decode error")
            }
        })
        dataTask?.resume()
    }
    
    
    func getImageDataFrom(url:URL, completion: @escaping ((Data) -> Void)) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
    
    
    
}
