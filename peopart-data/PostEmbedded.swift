//
//  PostEmbedded.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

struct PostEmbedded : PostEmbeddedProtocol {
  let post: PostProtocol
  let author: UserProtocol
  let comments: [CommentProtocol]
}
