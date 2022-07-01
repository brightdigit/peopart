//
//  UserListView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI
import Combine


struct UserListView: View {
  @EnvironmentObject var dataset : DataEnvironmentObject
    var body: some View {
      Group{
        switch dataset.usersResult {
        case .success(let users):
          List(users) { user in
            UserItemView(user: user)
          }
        case .failure(let error):
          Text(error.localizedDescription)
        case .none:
          ProgressView()
        }
      }.onAppear{
        self.dataset.usersTrigger.send()
      }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
