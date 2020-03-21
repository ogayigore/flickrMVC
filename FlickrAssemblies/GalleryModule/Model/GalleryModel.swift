//
//  GalleryModel.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

protocol GalleryModelOutput {
    func collectionChanged(collection: [PresentationPost])
}

protocol GalleryModel {
    var output: GalleryModelOutput? { get set }
    
    func getPosts(completion: ([PresentationPost]) -> Void)
}

class GalleryModelImpl: GalleryModel {
    var network: Network! //injected
    var storage: Storage! //injected
    var output: GalleryModelOutput?
    var presentationPostsArray = [PresentationPost]()
    
    func getPosts(completion: ([PresentationPost]) -> Void) {
        
        print("getPosts")
        network.load { posts in
            self.storage.store(array: posts.map { post in
                StoragePost(url: post.url, id: post.id, title: post.title, like: false)
            })
        }
    }
}

extension GalleryModelImpl: StorageOutput {
    func collectionChanged(collection: [StoragePost]) {
        print("collectionChanged in model")
        output?.collectionChanged(collection: collection.map { post in PresentationPost(url: post.url, title: post.title, like: post.like)})
    }
}
