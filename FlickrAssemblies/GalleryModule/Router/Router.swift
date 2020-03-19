//
//  Router.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class RouterAssembly {
    var router: Router {
        let router = RouterImpl()
        return router
    }
}

protocol Router {
    func push(in: UIViewController, postIndex: Int)
}

class RouterImpl: Router {
    let controllerAssembly = PostDetailsViewControllerAssembly()
    
    func push(in vc: UIViewController, postIndex: Int) {
        print("push")
        print("\(controllerAssembly)")
        vc.navigationController?.pushViewController(controllerAssembly.viewController(index: postIndex), animated: true)
    }
}
