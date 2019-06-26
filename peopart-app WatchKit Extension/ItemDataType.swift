//
//  ItemDataType.swift
//  peopart-app WatchKit Extension
//
//  Created by Leo Dion on 6/26/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

struct ItemDataType : DataType {
  func fetch(_ completion: (Result<[DataItem], Error>) -> Void) {
    completion(.success([ItemType(type: .user), ItemType(type: .post)] ))
  }
}
