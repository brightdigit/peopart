//
//  UserEmbeddedProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol UserEmbeddedProtocol {
  var user : UserProtocol { get }
  var posts : [PostProtocol] { get }
}
