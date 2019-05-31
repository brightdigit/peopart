//
//  File.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

protocol DatabaseProtocol {
  static var shared : DatabaseProtocol { get }
  func users (_ completion: @escaping (Result<[UserEmbeddedProtocol], Error>) -> Void)
  func posts (_ completion: @escaping (Result<[PostEmbeddedProtocol], Error>) -> Void)
}
