//
//  ReduxDemoApp.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import SwiftUI

@main
struct ReduxDemoApp: App {
    var body: some Scene {

        let store = Store(reducer: appReducer, state: AppState(), middlewares: [logMiddleware(), incrementMiddleware()])

        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
