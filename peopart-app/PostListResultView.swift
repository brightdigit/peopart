//
//  PostListResultView.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import SwiftUI

struct PostListResultView: View {
  let postsResult : Result<[PostEmbeddedViewModel], Error>?
  var body: some View {
    Group{
      switch postsResult {
      case .success(let posts):
        List(posts) { post in
          PostItemView(post: post)
        }
      case .failure(let error):
        Text(error.localizedDescription)
      case .none:
        ProgressView()
      }
    }
  }
}
struct PostListResultView_Previews: PreviewProvider {
    static var previews: some View {
        PostListResultView(postsResult: nil)
    }
}
