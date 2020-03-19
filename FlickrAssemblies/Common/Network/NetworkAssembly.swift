//
//  NetworkAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation

class NetworkAssembly {
    var urlSessionProvider: URLSessionProvider {
        return SharedURLSessionProvider()
    }
    
    func network(with provider: URLSessionProvider) -> Network {
        let network = NetworkImpl()
        network.provider = provider
        return network
    }
}
