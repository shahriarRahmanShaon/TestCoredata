//
//  TestCoredataApp.swift
//  TestCoredata
//
//  Created by sergio shaon on 12/4/22.
//

import SwiftUI

@main
struct TestCoredataApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
