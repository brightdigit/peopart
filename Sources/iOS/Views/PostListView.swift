//
//  PostsTableViewController.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import SwiftUI

//class PostsTableViewController: UITableViewController {
struct PostListView : View {
  var body: some View {
    Text("Posts")
  }
}
//  var posts : [PostEmbeddedProtocol]?
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    self.tableView.register(UINib(nibName: "PostsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "posts")
//    Database.shared.posts { (result) in
//      if case let .success(posts) = result {
//        self.posts = posts
//        DispatchQueue.main.async {
//          self.tableView.reloadData()
//        }
//      }
//    }
//  }
//
//  // MARK: - Table view data source
//
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    // #warning Incomplete implementation, return the number of rows
//    return self.posts?.count ?? 0
//  }
//
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "posts", for: indexPath)
//
//    // Configure the cell...
//    guard let post = self.posts?[indexPath.row] else {
//      return cell
//    }
//
//    guard let postCell = cell as? PostsTableViewCell else {
//      return cell
//    }
//
//
//    guard let avatarData = try? Data(contentsOf: post.author.avatar) else {
//      return cell
//    }
//
//    guard let imageData = try? Data(contentsOf: post.post.image) else {
//      return cell
//    }
//
//    postCell.authorNameLabel.text = post.author.name
//    postCell.avatarView.image = UIImage(data: avatarData)
//    postCell.postImageView.image = UIImage(data: imageData)
//    postCell.titleLabel.text = post.post.title
//    postCell.bodyLabel.text = post.post.text
//    postCell.dateLabel.text = "\(post.post.date)"
//    postCell.authorNameLabel.text = post.author.name
//
//    return postCell
//  }
//}
//
//extension PostsTableViewController : TabItemable {
//  func configureTabItem(_ tabItem: UITabBarItem) {
//    tabItem.image = UIImage(named: "Post")
//    tabItem.title = "Posts"
//  }
//}
