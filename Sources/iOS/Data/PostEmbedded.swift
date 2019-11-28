//
//  PostEmbedded.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Post with embedded linked data.
 */
struct PostEmbedded : PostEmbeddedProtocol {
  /**
    Primary post data.
  */
  let post: PostProtocol
  
  /**
   Author data.
   */
  let author: UserProtocol
  
  /**
   All comment data of the post in descending date order.
   */
  let comments: [CommentProtocol]
}
