import WatchKit

class PostDataItem : NSObject, MenuItem {
  let dataType: DataFetcher? = nil
  let post : AnyPost
  
  init (post: AnyPost) {
    self.post = post
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
