//
//  DetailsView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/22/24.
//
import SwiftUI

struct DetailsView: View {
    let taskName: String
    
    var body: some View {
        VStack {
            Text(taskName)
            Text("Placeholder description")
            Text("Placeholder mark complete button")
        }
    }
}
