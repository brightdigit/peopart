//
//  User.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 User data structure.
 */
struct User : UserProtocol, Codable {
  /**
    User id.
  */
  let id : UUID
  /**
   User name.
   */
  let name : String
  /**
   User avatar image url.
   */
  let avatar : URL
  /**
   User badge.
   */
  let badge : String
}
