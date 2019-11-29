//
//  UsersTableViewController.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import SwiftUI

//class UsersTableViewController: UITableViewController {
struct UserListView : View {
  var body: some View {
    Text("Users")
  }
}
//  var users : [UserEmbeddedProtocol]?
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "users")
//    Database.shared.users { (result) in
//      if case let .success(users) = result {
//        self.users = users
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
//    return self.users?.count ?? 0
//  }
//
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "users", for: indexPath)
//
//    guard let user = self.users?[indexPath.row] else {
//      return cell
//    }
//
//    guard let imageData = try? Data(contentsOf: user.user.avatar) else {
//      return cell
//    }
//
//    guard let userCell = cell as? UsersTableViewCell else {
//      return cell
//    }
//
//    userCell.avatarImageView.image = UIImage(data: imageData)
//    userCell.nameLabel.text = user.user.name
//    userCell.badgeLabel.text = user.user.badge
//
//    return userCell
//  }
//}
//
//extension UsersTableViewController : TabItemable {
//  func configureTabItem(_ tabItem: UITabBarItem) {
//    tabItem.image = UIImage(named: "User")
//    tabItem.title = "Users"
//  }
//}
