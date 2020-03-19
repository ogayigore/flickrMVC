//
//  PostDetailsViewController.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import UIKit

class PostDetailsViewController: UIViewController {

    var model: PostDetailsModel! //injected
    var post: PresentationPostDetails! 
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getPostToDisplay()
        // Do any additional setup after loading the view.
    }


}
