//
//  PostEmbeddedProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Protocol for Post with embedded linked data.
 */
protocol PostEmbeddedProtocol : AnyPost{
  /**
   Primary post data.
   */
  var post : PostProtocol { get }
  
  /**
   Author data.
   */
  var author : UserProtocol { get }
  
  /**
   All comment data of the post in descending date order.
   */
  var comments : [CommentProtocol] { get }
}

extension PostEmbeddedProtocol {
  
  /**
   Title of the post.
   */
  var title: String {
    return post.title
  }
}
