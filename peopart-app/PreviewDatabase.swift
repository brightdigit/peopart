import Foundation


struct PreviewDatabase : DatabaseProtocol {
  static var shared: DatabaseProtocol {
    fatalError()
  }
  
  let usersResult : Result<[UserEmbeddedProtocol], Error>
  
  let postsResult : Result<[PostEmbeddedProtocol], Error>
  func users(_ completion: @escaping (Result<[UserEmbeddedProtocol], Error>) -> Void) {
    completion(self.usersResult)
  }
  
  func posts(fromUserID userID: UUID?, _ completion: @escaping (Result<[PostEmbeddedProtocol], Error>) -> Void) {
    completion(self.postsResult)
  }
  
  
}
