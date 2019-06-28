//
//  ItemDataType.swift
//  peopart-app WatchKit Extension
//
//  Created by Leo Dion on 6/26/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

struct MenuItemFetcher : DataFetcher {
  func fetch(_ completion: (Result<[MenuItem], Error>) -> Void) {
    completion(.success([SelectionMenuItem(type: .user), SelectionMenuItem(type: .post)] ))
  }
}
