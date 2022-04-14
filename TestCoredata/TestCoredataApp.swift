//
//  TestCoredataApp.swift
//  TestCoredata
//
//  Created by sergio shaon on 12/4/22.
//

import SwiftUI

@main
struct TestCoredataApp: App {
    @StateObject private var dataController = DataController() // instantiate the database saying this database might change in time
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            //we put the container into environment so that we can use this throughout the whole app
        }
    }
}
