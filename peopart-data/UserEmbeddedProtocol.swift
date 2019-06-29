//
//  UserEmbeddedProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Protocol for User with embedded linked data.
 */
protocol UserEmbeddedProtocol {
  /**
   Primary User Data.
   */
  var user : UserProtocol { get }
  /**
   List of the user's posts.
   */
  // var posts : [PostProtocol] { get }
}

extension UserEmbeddedProtocol {
  /**
   String representing summary data for the post.
   */
  var summary : String {
    // calculate summary here
    return "Lorem Ipsum"
  }
}
