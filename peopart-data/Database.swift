//
//  Database.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

struct Database : DatabaseProtocol {
  
  let dataset : Dataset
  
  public static let defaultSource : DataSource = .bundle(Bundle.main, withResource: "db", andExtension: "json")
  
  public static let shared: DatabaseProtocol = try! Database()
  
  /**
   Creates a Database to pull users, posts, and comments form.
   
   - Parameter source: optional `DataSource` which defines where to pull the data from
   
   */
  private init (source: DataSource = defaultSource) throws {
    let dbData = try source.getData()
    let jsonDecoder = JSONDecoder()
    // TODO: Uh-Oh! Post Dates?!?!?
    let tables = try jsonDecoder.decode(Dataset.self, from: dbData)
    self.dataset = tables
  }
  
  /**
   Asyncronous method for attempting to fetch the list of users.
   
   - Parameter completion: callback which takes a Result of either the list of users or the error.
   
   */
  public func users(_ completion: @escaping (Result<[UserProtocol], Error>) -> Void) {
    // TODO: map and use the `UserEmbeddedProtocol`
    completion(.success(self.dataset.users))
  }
  
  /**
   Asyncronous method for attempting to fetch the list of posts.
   
   - Parameter completion: callback which takes a Result of either the list of posts or the error.
   */
  func posts(_ completion: @escaping (Result<[PostEmbeddedProtocol], Error>) -> Void) {
    // TODO: map and use the `PostEmbeddedProtocol`
  }
}
