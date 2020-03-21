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
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let post = model.getPostToDisplay()
        print("post - \(post)")
        
        photoImageView.kf.setImage(with: post.url)
        titleLabel.text = post.title
        
        setStateButton()
    }
    
    @IBAction func likeButtonPressed() {
        print("likeButtonPressed")
        let post = model.getPostToDisplay()
        model.toggle(postId: post.id, like: !post.isLiked)
        setStateButton()
    }
    
}

extension PostDetailsViewController {
    func setStateButton() {
        if model.getPostToDisplay().isLiked {
            likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
        } else {
            likeButton.setBackgroundImage(UIImage(named: "unlike"), for: .normal)
        }
    }
}
