import SwiftUI
import Combine


class DataEnvironmentObject : ObservableObject {
  internal init(database: DatabaseProtocol) {
    self.database = database
    
    usersTrigger.flatMap{
      Future { completed in
        self.database.users{
          completed(.success($0))
        }
      }
    }.map({ result in
      result.map{
        $0.map(UserEmbeddedViewModel.init(object:))
      }
    }).print().receive(on: DispatchQueue.main)
      .assign(to: &self.$usersResult)
    
    postsTrigger.flatMap{
     Future { completed in
       self.database.posts(fromUserID: nil){
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
  
  let database : DatabaseProtocol
  let usersTrigger = PassthroughSubject<Void, Never>()
  let postsTrigger = PassthroughSubject<Void, Never>()
  
  @Published var usersResult : Result<[UserEmbeddedViewModel], Error>?
  
  @Published var postsResult : Result<[PostEmbeddedViewModel], Error>?
}
