//
//  DetailsView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/22/24.
//
import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
            Text("Placeholder description")
            Button("Mark Complete") {
                task.isCompleted = true
            }
        }
    }
}

#Preview {
    DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isCompleted: false, lastCompleted: nil)))
}
