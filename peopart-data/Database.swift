//
//  Database.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

public struct Database : DatabaseProtocol {
  let tables : DataSet
  
  public static let defaultSource : DataSource = .bundle(Bundle.main, withResource: "db", andExtension: "json")
  public static let shared: DatabaseProtocol = try! Database()
  
  private init (source: DataSource = defaultSource) throws {
    
    let dbData = try source.getData()
    let jsonDecoder = JSONDecoder()
    let tables = try jsonDecoder.decode(DataSet.self, from: dbData)
    self.tables = tables
  }
  
  public func users(_ completion: @escaping (Result<[UserProtocol], Error>) -> Void) {
    completion(.success(self.tables.users))
  }
  
}
