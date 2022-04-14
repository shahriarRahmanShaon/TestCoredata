import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "TestCoredata") // let the app knows there exist a database named testcoredata
    
    init() {
        container.loadPersistentStores { description, error in // loading the database with closure desc and error
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
           // self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
