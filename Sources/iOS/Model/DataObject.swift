//
//  DataObject.swift
//  Peopart_iOS_Framework
//
//  Created by Leo Dion on 11/28/19.
//

import Combine
import SwiftUI

public class DataObject : ObservableObject {
  @Published var users : Result<[UserEmbedded], Error>?
  let publisher : AnyPublisher<Dataset, Error>
  let source : DataSource
  var cancellable : AnyCancellable!
  
  init (source : DataSource) {
    self.source = source
    self.publisher = source.dataPublisher
    self.cancellable = publisher.map { (dataset) -> Result<[UserEmbedded], Error>  in
        let postDictionary = [UUID : [Post]](grouping: dataset.posts, by: { (post) -> UUID in
            return post.userId
          }).mapValues { (posts) -> [Post] in
            posts.sorted(by: { (lhs, rhs) -> Bool in
              return lhs.date > rhs.date
            })
          }
          
          let usersEmbeddeds = dataset.users.map { (user) -> UserEmbedded in
            return UserEmbedded(user: user, posts: postDictionary[user.id] ?? [PostProtocol]())
            }.sorted(by: { (lhs, rhs) -> Bool in
              lhs.posts.count > rhs.posts.count
            })
      return Result<[UserEmbedded], Error>.success(usersEmbeddeds)
    }.catch({ (error) in
      Just(.failure(error))
    }).receive(on: DispatchQueue.main).assign(to: \.users, on: self)
  }
  
  
}

extension DataSource {
  var dataPublisher : AnyPublisher<Dataset, Error> {
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .formatted(.custom)
    switch self {
      case .bundle(let bundle, let resource, let ext):
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
          return Fail(outputType: Dataset.self, failure: DataSourceError.missingResource(bundle, withResource: resource, andExtension: ext) as Error).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Dataset.self, decoder: jsonDecoder).eraseToAnyPublisher()
    case .url(let url):
      return URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Dataset.self, decoder: jsonDecoder).eraseToAnyPublisher()
    case .data(let data):
      return Result{
        try (jsonDecoder).decode(Dataset.self, from: data)
        }.publisher.eraseToAnyPublisher()
    }
  }
}
