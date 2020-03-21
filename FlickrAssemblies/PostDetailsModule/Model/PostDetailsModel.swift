//
//  PostDetailsModel.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

protocol PostDetailsModel {
    var index: Int { get set }
    func getPostToDisplay() -> PresentationPostDetails
    func toggle(postId: String, like: Bool)
}

class PostDetailsModelImpl: PostDetailsModel {
    var storage: Storage! //injected
    var index = 0
    
    func getPostToDisplay() -> PresentationPostDetails {
        
        return PresentationPostDetails(id: storage.storeArray[index].id, url: storage.storeArray[index].url, title: storage.storeArray[index].title, isLiked: storage.storeArray[index].like)
    }
    
    func toggle(postId: String, like: Bool) {
        print("toggle")
        storage.like(id: postId, liked: like)
    }
}
