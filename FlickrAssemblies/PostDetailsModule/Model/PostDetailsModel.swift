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
    func toggle(like: Bool)
}

class PostDetailsModelImpl: PostDetailsModel {
    var storage: Storage! //injected
    var postId: String! //injected
    var index = 0
    
    func getPostToDisplay() -> PresentationPostDetails {
        return PresentationPostDetails(url: URL(string: "")!,
                                       title: "",
                                       isLiked: false)
    }
    
    func toggle(like: Bool) {
        storage.like(id: postId, liked: like)
    }
}

extension PostDetailsModelImpl: StorageOutput {
    func collectionChanged(collection: [StoragePost]) {
        collection.map { post in
            PresentationPostDetails(url: post.url, title: post.title, isLiked: post.like)
        }
    }
}
