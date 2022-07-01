//
//  UserPostsObject.swift
//  peopart-app
//
//  Created by Leo Dion on 7/1/22.
//  Copyright © 2022 Leo Dion. All rights reserved.
//

import Foundation
import Combine

class UserPostsObject : ObservableObject {
  internal init(userID: UUID? = nil) {
    self.userID = userID
    if let userID = userID {
      postsTrigger.flatMap{ database in
        
        Future { completed in
          database.posts(fromUserID: userID){
            completed(.success($0))
          }
        }
      }.map({ result in
        result.map{
          $0.map(PostEmbeddedViewModel.init(object:))
        }
      }).receive(on: DispatchQueue.main)
        .assign(to: &self.$postsResult)
    }
  }
  
  let userID : UUID?
  
  let postsTrigger = PassthroughSubject<DatabaseProtocol, Never>()
  
  @Published var postsResult : Result<[PostEmbeddedViewModel], Error>?
}
