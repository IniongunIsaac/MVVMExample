//
//  MVVMExampleApp.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 19/04/2023.
//

import SwiftUI

@main
struct MVVMExampleApp: App {
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
