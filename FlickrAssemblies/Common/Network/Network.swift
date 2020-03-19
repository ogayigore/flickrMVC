//
//  Network.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 05.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

protocol Network {
    func load(completion: @escaping ([Post]) -> Void)
    func like(postId: String)
}

protocol URLSessionProvider {
    var urlSession: URLSession { get }
}

class SharedURLSessionProvider: URLSessionProvider {
    let urlSession = URLSession.shared
}

class NetworkImpl: Network {
    
    let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=69fd977268ba709dfa6afe13cd93efeb&format=json&nojsoncallback=1")!
    
    var provider: URLSessionProvider?
    
    func load(completion: @escaping ([Post]) -> Void) {
        print("network.load")
        provider?.urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                print("получили фотки: \(response.photos.photo.count)")
                completion(response.photos.photo)
            } catch {
                print("ошибка - \(error)")
                completion([])
            }
        }.resume()
    }
    
    func like(postId: String) {
        
    }
}
