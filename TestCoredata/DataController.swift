import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "TestCoredata")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
