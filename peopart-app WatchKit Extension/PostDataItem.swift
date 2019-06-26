import WatchKit

class PostDataItem : NSObject, DataItem {
  let dataType: DataType? = nil
  let post : PostItem
  
  init (post: PostProtocol) {
    self.post = .post(post)
  }
  
  
  init (embed: PostEmbeddedProtocol) {
    self.post = .embed(embed)
  }
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, configureRowAtIndex index: Int) {
    guard let rowController = table.rowController(at: index) as? RowController else {
      return
    }
    
    rowController.image.setImage(UIImage(named: "Post"))
    rowController.label.setText(self.post.title)
  }
  
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, didSelectRowAt index: Int) {
    
  }
  
  
  
}
