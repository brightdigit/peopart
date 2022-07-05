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
  
    var main: some View {
        Group{
            if #available(iOS 16.0, *) {
                //Group{
                switch dataset.usersResult {
                case .success(let users):
                    
                    NavigationStack {
                        List{
                            ForEach(users) { user in
                                NavigationLink(value: user) {
                                    UserItemView(user: user)
                                }
                            }
                        }.navigationDestination(for: UserEmbeddedViewModel.self) { user in
                            PostListView(userID: user.id).navigationTitle("\(user.object.user.name) Posts")
                        }.navigationTitle("Users")
                    }
                case .failure(let error):
                    Text(error.localizedDescription)
                case .none:
                    ProgressView()
                }
                //.navigationTitle("Users")
                
            } else {
                NavigationView {
                    UserResultView(usersResult: dataset.usersResult).navigationTitle("Users")
                }
            }
        }
    }
  var body: some View {
      main.onAppear{
        self.dataset.usersTrigger.send()
      }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
