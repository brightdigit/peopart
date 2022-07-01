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
  var body: some View {
    Group{
      switch dataset.postsResult {
      case .success(let posts):
        List(posts) { post in
          PostItemView(post: post)
        }
      case .failure(let error):
        Text(error.localizedDescription)
      case .none:
        ProgressView()
      }
    }.onAppear{
      self.dataset.postsTrigger.send()
    }
  }
}


struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView().environmentObject(DataEnvironmentObject(database: PreviewDatabase(usersResult: .success([]), postsResult: .success([]))))
  }
}
