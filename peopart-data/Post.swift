//
//  Post.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Post data structure.
 */
struct Post : PostProtocol, Codable {
  /**
    Post author user id.
  */
  let userId: UUID
  /**
   Post id.
   */
  let id: UUID
  /**
   Title of the post.
   */
  let title: String
  /**
   Image for the post.
   */
  let image: URL
  /**
   Text of the post.
   */
  let text: String
  /**
   Publish data of the post.
   */
  let date: Date
}
