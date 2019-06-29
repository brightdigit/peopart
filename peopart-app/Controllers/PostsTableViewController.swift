//
//  PostsTableViewController.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
  var posts : [PostEmbeddedProtocol]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.register(UINib(nibName: "PostsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "posts")
    Database.shared.posts { (result) in
      if case let .success(posts) = result {
        self.posts = posts
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.posts?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "posts", for: indexPath)
    
    // Configure the cell...
    guard let post = self.posts?[indexPath.row] else {
      return cell
    }
    
    guard let postCell = cell as? PostsTableViewCell else {
      return cell
    }
    
    
    postCell.authorNameLabel.text = post.author.name
    
    DispatchQueue.global().async {
      let avatarData = (try? Data(contentsOf: post.author.avatar)).flatMap(UIImage.init(data:))
      let imageData = (try? Data(contentsOf: post.post.image)).flatMap(UIImage.init(data:))
      DispatchQueue.main.async {
        postCell.avatarView.image =  avatarData
        postCell.postImageView.image = imageData
      }
    }
    
    postCell.titleLabel.text = post.post.title
    postCell.bodyLabel.text = post.post.text
    postCell.dateLabel.text = "\(post.post.date)"
    postCell.authorNameLabel.text = post.author.name
    
    return postCell
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension PostsTableViewController : TabItemable {
  func configureTabItem(_ tabItem: UITabBarItem) {
    tabItem.image = UIImage(named: "Post")
    tabItem.title = "Posts"
  }
}
