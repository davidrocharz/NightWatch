//
//  Task.swift
//  NightWatch
//
//  Created by David Rocharz on 9/22/24.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
    var lastCompleted: Date?
}
