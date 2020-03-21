//
//  PostDetailsModelAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

class PostDetailsModelAssembly {
    private lazy var storageAssembly = StorageAssembly()
    
    var model: PostDetailsModel {
        let model = PostDetailsModelImpl()
        model.storage = storageAssembly.storage()
        return model
    }
}
