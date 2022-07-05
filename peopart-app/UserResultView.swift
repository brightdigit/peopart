//
//  UserResultView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI

struct UserResultView: View {
  let usersResult : Result<[UserEmbeddedViewModel], Error>?
    var body: some View {
      Group{
        switch usersResult {
        case .success(let users):
          List(users) { user in
            Group {
              if #available(iOS 16.0, *) {
                UserItemView(user: user).navigationDestination(for: UserEmbeddedViewModel.self) { user in
                  PostListView(userID: user.id).navigationTitle("\(user.object.user.name) Posts")
                }
                
                 
              } else {
                
                  NavigationLink {
                    PostListView(userID: user.id).navigationTitle("\(user.object.user.name) Posts")
                  } label: {
                    
                    UserItemView(user: user)
                  }
              }
            }
            
          }
        case .failure(let error):
          Text(error.localizedDescription)
        case .none:
          ProgressView()
        }
      }
    }
}

struct UserResultView_Previews: PreviewProvider {
    static var previews: some View {
      UserResultView(usersResult: nil)
    }
}
