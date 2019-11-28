//
//  Comment.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Comment data structure.
 */
struct Comment : CommentProtocol, Codable {
  /**
   Id of the comment.
   */
  let id: UUID
  /**
   Id of originating post.
   */
  let postId: UUID
  /**
   Id of comment author user.
   */
  let userId: UUID
  /**
   Text of the comment.
   */
  let text: String
  /**
   Publish date of the comment.
   */
  let date: Date
}
