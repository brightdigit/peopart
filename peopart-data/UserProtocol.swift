//
//  UserProtocol.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

public protocol UserProtocol {
  var id : UUID { get }
  var name : String { get }
  var avatar : URL { get }
  var badge : String { get }
}
