//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by David Rocharz on 9/21/24.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightwatchTasks = NightWatchTasks()
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTasks: nightwatchTasks)
        }
    }
}
