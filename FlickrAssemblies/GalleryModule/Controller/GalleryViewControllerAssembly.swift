//
//  GalleryViewControllerAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewControllerAssembly {
    
    private lazy var modelAssembly = GalleryModelAssembly()
    private lazy var routerAssembly = RouterAssembly()
    
    func controller(with model: GalleryModel) -> GalleryViewController {
        let controller = GalleryViewController()
        controller.model = model
        return controller
    }
    
    var viewController: GalleryViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
        var model = modelAssembly.model
        controller.model = model
        model.output = controller
        controller.router = routerAssembly.router
        return controller
    }
    
    var router: Router {
        return RouterImpl()
    }
}
