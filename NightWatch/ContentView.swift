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
    "Check inside all vacant rooms",
    "Walk the perimeter of property"
]

var monthlyTasks = [
    "Test security alarm",
    "Test motion detectors",
    "Test smoke alarms"
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: Nightly Tasks
                Section(header: TaskSectionHeader(systemIcon: "moon.stars", title: "Nightly Tasks")) {
                    ForEach(nightlyTasks, id: \.self) {
                        task in
                        NavigationLink(destination: DetailsView(taskName: task)) {
                            Text(task)
                        }
                    }
                }
                // MARK: Weekly Tasks
                Section(header: TaskSectionHeader(systemIcon: "sunset", title: "Weekly Tasks")) {
                    ForEach(weeklyTasks, id: \.self) {
                        task in
                        NavigationLink(destination: DetailsView(taskName: task)) {
                            Text(task)
                        }
                    }
                }
                // MARK: Monthly Tasks
                Section(header: TaskSectionHeader(systemIcon: "calendar", title: "Monthly Tasks")) {
                    ForEach(monthlyTasks, id: \.self) {
                        task in
                        NavigationLink(destination: DetailsView(taskName: task)) {
                            Text(task)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Home")
        }
    }
}

struct TaskSectionHeader: View {
    let systemIcon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: systemIcon)
            Text(title)
        }.font(.title).foregroundColor(.yellow).fontWeight(.heavy)
    }
}

#Preview {
    ContentView()
}
