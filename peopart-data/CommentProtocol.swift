//
//  CommentProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
  Protocol for Comment Data
 */
protocol CommentProtocol {
  /**
   Id of the comment.
   */
  var id : UUID { get }
  /**
   Id of originating post.
   */
  var postId : UUID { get }
  /**
   Id of comment author user.
   */
  var userId : UUID { get }
  /**
   Text of the comment.
   */
  var text : String { get }
  /**
   Publish date of the comment.
   */
  var date : Date { get }
}
