//
//  PostDetailsViewController.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 06.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import UIKit
import Kingfisher

class PostDetailsViewController: UIViewController {

    var model: PostDetailsModel! //injected
    var post: PresentationPostDetails! 
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        post = model.getPostToDisplay()
        // Do any additional setup after loading the view.
        photoImageView.kf.setImage(with: post.url)
        titleLabel.text = post.title
        if post.isLiked {
            likeButton.setImage(UIImage(named: "like"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "unlike"), for: .normal)
        }
    }
    
    @IBAction func likeButtnPressed() {
        model.toggle(like: post.isLiked) 
    }
    
}
