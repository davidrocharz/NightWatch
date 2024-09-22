//
//  ContentView.swift
//  NightWatch
//
//  Created by David Rocharz on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    // MARK: Nightly Tasks
                    Group {
                        HStack {
                            Text(Image(systemName: "moon.stars"))
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .padding(.top)
                            Text("Nightly Tasks")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .textCase(.uppercase)
                                .padding(.top)
                        }
                        Text("- Check all windows")
                        Text("- Check all doors")
                        Text("- Check that the safe is locked")
                        Text("- Check that the mailbox is empty")
                        Text("- Check security cameras")
                        Text("- Clear ice from sidewalks")
                        Text("- Document \"strange and unusual occurances\"")
                    }
                    Divider()
                    // MARK: Weekly Tasks
                    Group {
                        HStack {
                            Text(Image(systemName: "sunset"))
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .padding(.top)
                            Text("Weekly Tasks")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .textCase(.uppercase)
                                .padding(.top)
                        }
                    }
                    Divider()
                    // MARK: Monthly Tasks
                    Group {
                        HStack {
                            Text(Image(systemName: "calendar"))
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .padding(.top)
                            Text("Monthly Tasks")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .textCase(.uppercase)
                                .padding(.top)
                        }
                    }
                }.padding([.top, .leading])
                Spacer()
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
