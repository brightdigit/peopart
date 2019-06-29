//
//  UserEmbedded.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation
/**
 User with embedded linked data.
 */
struct UserEmbedded : UserEmbeddedProtocol {
  /**
    Primary User Data.
  */
  let user: UserProtocol
  /**
   List of the user's posts.
   */
  let posts: [PostProtocol]
}
