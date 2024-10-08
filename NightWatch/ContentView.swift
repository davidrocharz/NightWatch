//
//  ContentView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    @State var editMode: EditMode = .inactive
    @State var resetAlertShowing: Bool = false
    let resetAlertMessage: String = "Are you sure?"
    
    var body: some View {
        NavigationView {
            List {
                // MARK: Nightly Tasks
                Section(header: TaskSectionHeader(systemIcon: "moon.stars", title: "Nightly Tasks")) {
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id) {
                        task, taskIndex in
                        let taskWrapper = $nightWatchTasks
                        let tasksBinding = taskWrapper.nightlyTasks
                        let boundTask = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && boundTask.isCompleted.wrappedValue == false) {
                            NavigationLink(destination: DetailsView(task: boundTask), label: {TaskRow(task: boundTask)})
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .transition(.slide)
                }
                // MARK: Weekly Tasks
                Section(header: TaskSectionHeader(systemIcon: "sunset", title: "Weekly Tasks")) {
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id) {
                        task, taskIndex in
                        let taskWrapper = $nightWatchTasks
                        let tasksBinding = taskWrapper.weeklyTasks
                        let boundTask = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && boundTask.isCompleted.wrappedValue == false) {
                            NavigationLink(destination: DetailsView(task: boundTask), label: {TaskRow(task: boundTask)})
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .transition(.slide)
                }
                // MARK: Monthly Tasks
                Section(header: TaskSectionHeader(systemIcon: "calendar", title: "Monthly Tasks")) {
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id) {
                        task, taskIndex in
                        let taskWrapper = $nightWatchTasks
                        let tasksBinding = taskWrapper.monthlyTasks
                        let boundTask = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && boundTask.isCompleted.wrappedValue == false) {
                            NavigationLink(destination: DetailsView(task: boundTask), label: {TaskRow(task: boundTask)})
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .transition(.slide)
                }
            }
            // MARK: Toolbar
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    EditButton()
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(role: .destructive, action: {
                        resetAlertShowing = true
                    }, label: {
                        Text("Reset").foregroundStyle(.red)
                    })
                })
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    withAnimation {
                        Toggle("Focus Mode", isOn: $focusModeOn.animation()).toggleStyle(.switch)
                    }
                    Spacer()
                }
            }
            .environment(\.editMode, $editMode)
            .listStyle(.grouped)
            .navigationTitle("Home")
            .alert(
                "Reset Tasks",
                isPresented: $resetAlertShowing,
                presenting: resetAlertMessage
            ) {_ in
                Button(role: .destructive) {
                    let refreshedTasks = NightWatchTasks()
                    self.nightWatchTasks.nightlyTasks = refreshedTasks.nightlyTasks
                    self.nightWatchTasks.weeklyTasks = refreshedTasks.weeklyTasks
                    self.nightWatchTasks.monthlyTasks = refreshedTasks.monthlyTasks
                } label: {
                    Text("Confirm")
                }
            } message: { _ in
                Text("Are you sure?")
            }
        }
    }
}

// MARK: Task Section Header
struct TaskSectionHeader: View {
    let systemIcon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: systemIcon)
            Text(title)
        }.font(.title2).foregroundColor(.yellow).fontWeight(.heavy)
    }
}

// MARK: Task Row
struct TaskRow: View {
    @Binding var task: Task

    var body: some View {
        VStack {
            if task.isCompleted {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                }.foregroundStyle(.gray).strikethrough()
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

#Preview("Home") {
    let nightwatchTasks = NightWatchTasks()
    ContentView(nightWatchTasks: nightwatchTasks)
}

#Preview(
    "Task Row",
    traits: .fixedLayout(width: 300, height: 70)
) {
    TaskRow(task: Binding<Task>.constant(Task(name: "Test Task", isCompleted: false, lastCompleted: nil)))
}
