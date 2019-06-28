//
//  File.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Based Protocol for Accessing Data
 **/
public protocol DatabaseProtocol {
  
  static var shared : DatabaseProtocol { get }
  func users (_ completion: @escaping (Result<[UserProtocol], Error>) -> Void)  
}
