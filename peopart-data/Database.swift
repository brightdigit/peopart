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
  
  private init (source: DataSource = defaultSource) throws {
    
    let dbData = try source.getData()
    let jsonDecoder = JSONDecoder()
    let tables = try jsonDecoder.decode(Dataset.self, from: dbData)
    self.dataset = tables
  }
  
  public func users(_ completion: @escaping (Result<[UserEmbeddedProtocol], Error>) -> Void) {
    //completion(.success(self.dataset.users))
  }
  
}
