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
  
  @State var usersResult : Result<[UserEmbeddedViewModel], Error>?
  
  var body: some View {
      Group {
        if #available(iOS 16.0, *) {
          NavigationStack {
            //Group{
              switch usersResult {
              case .success(let users):
                List{
                  ForEach(users) { user in
                    UserItemView(user: user)
                  }
                }
              case .failure(let error):
                Text(error.localizedDescription)
              case .none:
                ProgressView()
              }
            }
            //.navigationTitle("Users")
          
        } else {
          NavigationView {
            UserResultView(usersResult: dataset.usersResult).navigationTitle("Users")
          }
        }
      }.onAppear{
        self.dataset.usersTrigger.send()
      }.onReceive(self.dataset.$usersResult) { userResults in
        self.usersResult = userResults
      }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
