//
//  StorageAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

class StorageAssembly {
    private static let storage = StorageImpl()
    
    func storage(with output: StorageOutput?) -> Storage {
        StorageAssembly.storage.output = output
        return StorageAssembly.storage
    }
}
