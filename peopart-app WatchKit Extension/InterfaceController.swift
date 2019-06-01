//
//  InterfaceController.swift
//  peopart-app WatchKit Extension
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import WatchKit
import Foundation

struct ItemDataType : DataType {
  var numberOfItems: Int {
    return 2
  }
  
  func configure(_ rowController: RowController, forIndex index: Int) {
    if index == 0 {
      rowController.image.setImage(UIImage(named: "User"))
      rowController.label.setText("Users")
    } else {
      rowController.image.setImage(UIImage(named: "Post"))
      rowController.label.setText("Posts")
    }
  }
   
}

protocol DataType {
  var numberOfItems : Int { get }
  func configure(_ rowController : RowController, forIndex index: Int)
}

class InterfaceController: WKInterfaceController {
  var dataType : DataType = ItemDataType()
  @IBOutlet weak var table: WKInterfaceTable!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
    table.setNumberOfRows(dataType.numberOfItems, withRowType: "row")
    
    for index in 0..<dataType.numberOfItems {
      guard let rowController = table.rowController(at: index) as? RowController else {
        continue
      }
      dataType.configure(rowController, forIndex: index)
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  
  
}
