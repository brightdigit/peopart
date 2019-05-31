//
//  Comment.swift
//  peopart-app
//
//  Created by Leo Dion on 5/31/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import Foundation

struct Comment : CommentProtocol, Codable {
  let id: UUID
  let postId: UUID
  let userId: UUID
  let text: String
  let date: Date
}
