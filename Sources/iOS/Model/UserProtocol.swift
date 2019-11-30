//
//  UserProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 User Protocol.
 */
public protocol UserProtocol {
  /**
   User id.
   */
  var id : UUID { get }
  /**
   User name.
   */
  var name : String { get }
  /**
   User avatar image url.
   */
  var avatar : URL { get }
  /**
   User badge.
   */
  var badge : String { get }
}
