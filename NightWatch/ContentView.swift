//
//  ContentView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/21/24.
//

import SwiftUI

var nightlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check that the mailbox is empty",
    "Check security cameras",
    "Clear ice from the sidewalks",
    "Document \"strange and unusual occurrences\""
]

var weeklyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check that the mailbox is empty"
]

var monthlyTasks = [
    "Check all windows",
    "Check all doors"
]

struct ContentView: View {
    var body: some View {
        List {
            Section(header: HStack(alignment: .bottom) {Image(systemName: "moon.stars")
                Text("Nightly Tasks")
            }.font(.title).foregroundColor(.yellow).fontWeight(.heavy)) {
                ForEach(nightlyTasks, id: \.self) { task in
                    Text(task)
                }
            }
            Section(header: HStack(alignment: .bottom) {Image(systemName: "sunset")
                Text("Weekly Tasks")
            }.font(.title).foregroundColor(.yellow).fontWeight(.heavy)) {
                ForEach(weeklyTasks, id: \.self) { task in
                    Text(task)
                }
            }
            Section(header: HStack(alignment: .bottom) {Image(systemName: "calendar")
                Text("Monthly Tasks")
            }.font(.title).foregroundColor(.yellow).fontWeight(.heavy)) {
                ForEach(monthlyTasks, id: \.self) { task in
                    Text(task)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
