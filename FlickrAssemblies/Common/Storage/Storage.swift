//
//  Storage.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

protocol StorageOutput {
    func collectionChanged(collection: [StoragePost])
}

protocol Storage {
    var output: StorageOutput? { get set }
    
    func store(array: [StoragePost])
    func load() -> [StoragePost]
    func like(id: String, liked: Bool)
}

class StorageImpl: Storage {
    
    var output: StorageOutput?
    var storeArray: [StoragePost] = []
    
    func store(array: [StoragePost]) {
        print("storage.store")
        storeArray = array
        print("storeArray - \(storeArray)")
        output?.collectionChanged(collection: storeArray)
    }
    
    func load() -> [StoragePost] {
        return storeArray
    }
    
    func like(id: String, liked: Bool) {
        
        guard let index = storeArray
            .firstIndex(where: { $0.id == id}) else { return }
        
        let post = StoragePost(url: storeArray[index].url,
                               id: id,
                               title: storeArray[index].title,
                               like: storeArray[index].like)
        
        storeArray[index] = post
        output?.collectionChanged(collection: storeArray)
    }
}
