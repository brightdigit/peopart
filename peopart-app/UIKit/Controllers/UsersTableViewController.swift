//
//  UsersTableViewController.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
  var users : [UserEmbeddedProtocol]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "users")
    Database.shared.users { (result) in
      if case let .success(users) = result {
        self.users = users
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.users?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "users", for: indexPath)
    
    guard let user = self.users?[indexPath.row] else {
      return cell
    }
    
    guard let imageData = try? Data(contentsOf: user.user.avatar) else {
      return cell
    }
    
    guard let userCell = cell as? UsersTableViewCell else {
      return cell
    }
    
    userCell.avatarImageView.image = UIImage(data: imageData)
    userCell.nameLabel.text = user.user.name
    userCell.badgeLabel.text = user.user.badge
    
    return userCell
  }
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let userID = self.users?[indexPath.row].user.id else {
      return
    }
    let viewController = PostsTableViewController(userID: userID)
    self.navigationController?.pushViewController(viewController, animated: true)
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

extension UsersTableViewController : TabItemable {
  func configureTabItem(_ tabItem: UITabBarItem) {
    tabItem.image = UIImage(named: "User")
    tabItem.title = "Users"
  }
}
