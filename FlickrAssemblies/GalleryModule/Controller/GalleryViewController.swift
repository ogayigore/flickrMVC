//
//  GalleryViewController.swift
//  FlickrAssemblies
//
//  Created by Игорь Огай on 05.03.2020.
//  Copyright © 2020 Игорь Огай. All rights reserved.
//

import UIKit
import Kingfisher

class GalleryViewController: UIViewController {
    
    var model: GalleryModel! //injected
    var router: Router?
    var posts = [PresentationPost]()
    
    @IBOutlet weak var tableView: UITableView!
    
    private let kTableViewCell = UINib(nibName: "GalleryTableViewCell", bundle: nil)
    private let kTableViewReuseIdentifier = "kGalleryTableViewReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        model.getPosts {
            posts = $0
        }
    }
}

// MARK: - Setting up UI for custom tableView cell

extension GalleryViewController {
    func setUpUI() {
        tableView.register(kTableViewCell, forCellReuseIdentifier: kTableViewReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Setting up UI for custom tableView cell

extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewReuseIdentifier, for: indexPath) as? GalleryTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = posts[indexPath.row].title
        cell.photoImageView.kf.setImage(with: posts[indexPath.row].url)
        if posts[indexPath.row].like == true {
           cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(named: "unlike"), for: .normal)
        }
        return cell
    }
}

extension GalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        print("indexPath.row = \(indexPath.row)")
        router?.push(in: self, postIndex: indexPath.row)
    }
}

extension GalleryViewController: GalleryModelOutput {
    func collectionChanged(collection: [PresentationPost]) {
        posts = collection
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
