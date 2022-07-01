//
//  PostListView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI


struct PostListView: View {
  @EnvironmentObject var dataset : DataEnvironmentObject
  @StateObject var userPostsObject : UserPostsObject
  
  var postsResult : Result<[PostEmbeddedViewModel], Error>? {
    return self.userPostsObject.userID != nil ? self.userPostsObject.postsResult : self.dataset.postsResult
  }
  init (userID : UUID? = nil) {
    self._userPostsObject = StateObject(wrappedValue: UserPostsObject(userID: userID))
  }
  
  var body: some View {
    PostListResultView(postsResult: self.postsResult).onAppear {
      if self.userPostsObject.userID != nil {
        self.userPostsObject.postsTrigger.send(self.dataset.database)
      } else {
        self.dataset.postsTrigger.send()
      }
    }
  }
}


struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView().environmentObject(DataEnvironmentObject(database: PreviewDatabase(usersResult: .success([]), postsResult: .success([]))))
  }
}
