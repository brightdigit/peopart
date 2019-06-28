//
//  File.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

/**
 Database Protocol
 */
protocol DatabaseProtocol {
  /**
    Shared Database for Application.
  */
  static var shared : DatabaseProtocol { get }
  
  /**
   Asyncronous method for attempting to fetch the list of users.
   
   - Parameter completion: callback which takes a Result of either the list of users or the error.
   
   */
  func users (_ completion: @escaping (Result<[UserProtocol], Error>) -> Void)  
}
