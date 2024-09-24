//
//  NightWatchTasks.swift
//  NightWatch
//
//  Created by David Rocharz on 9/22/24.
//

import SwiftUI

class NightWatchTasks: ObservableObject {
    @Published var nightlyTasks = [
        Task(name: "Check all windows", isCompleted: true, lastCompleted: nil),
        Task(name: "Check all doors", isCompleted: false, lastCompleted: nil),
        Task(name: "Check that the safe is locked", isCompleted: false, lastCompleted: nil),
        Task(name: "Check that the mailbox is empty", isCompleted: true, lastCompleted: nil),
        Task(name: "Check security cameras", isCompleted: false, lastCompleted: nil),
        Task(name: "Clear ice from the sidewalks", isCompleted: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual occurrences\"", isCompleted: false, lastCompleted: nil)
    ]
    @Published var weeklyTasks = [
        Task(name: "Check inside all vacant rooms", isCompleted: true, lastCompleted: nil),
        Task(name: "Walk the perimeter of the property", isCompleted: false, lastCompleted: nil)
    ]
    @Published var monthlyTasks = [
        Task(name: "Test security alarm", isCompleted: false, lastCompleted: nil),
        Task(name: "Test motion detectors", isCompleted: true, lastCompleted: nil),
        Task(name: "Test smoke alarms", isCompleted: false, lastCompleted: nil)
    ]

}
