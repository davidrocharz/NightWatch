//
//  DetailsView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/22/24.
//
import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "map")
                Text("Placeholder for hotel floor plan")
            }
            Text(task.name)
            
            if verticalSizeClass == .regular {
                Divider()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed velit sit amet massa scelerisque imperdiet. Etiam tempor ex a lectus bibendum aliquam. Nulla bibendum ac nunc ullamcorper ultricies. Curabitur tristique tincidunt metus, in lacinia felis lobortis ac. Duis ut leo tortor. Sed efficitur ex id ipsum porttitor, eget hendrerit lectus porta. Nam eget congue lectus, sit amet dapibus lectus.")
            }
            Divider()
            Button("Mark Complete") {
                task.isCompleted = true
            }
        }.padding(.horizontal)
    }
}

#Preview {
    DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isCompleted: false, lastCompleted: nil)))
}
