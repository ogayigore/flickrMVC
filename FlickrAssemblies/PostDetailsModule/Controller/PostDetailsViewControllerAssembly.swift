//
//  PostDetailsViewControllerAssembly.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class PostDetailsViewControllerAssembly {
    
    private lazy var modelAssembly = PostDetailsModelAssembly()
    
    func controller(with model: PostDetailsModel) -> PostDetailsViewController {
        let controller = PostDetailsViewController()
        controller.model = model
        return controller
    }
    
    func viewController(index: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
        controller.model = modelAssembly.model
        controller.model.index = index
        return controller
    }
}
