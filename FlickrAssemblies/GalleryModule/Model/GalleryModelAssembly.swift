//
//  ModelAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

class GalleryModelAssembly {
    private lazy var networkAssembly = NetworkAssembly()
    private lazy var storageAssembly = StorageAssembly()
    
    var model: GalleryModel {
        let model = GalleryModelImpl()
        model.network = networkAssembly.network(with: networkAssembly.urlSessionProvider)
        model.storage = storageAssembly.storage(with: model)
        return model
    }
    
    func model(withStorageOutput output: StorageOutput) -> GalleryModel {
        let model = GalleryModelImpl()
        model.network = networkAssembly.network(with: networkAssembly.urlSessionProvider)
        model.storage = storageAssembly.storage(with: output)
        return model
    }
    
}
