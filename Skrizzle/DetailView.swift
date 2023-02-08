//
//  DetailView.swift
//  Skrizzle
//
//  Created by Derek Haus on 2023/02/07.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("ミーティングの情報")){
                NavigationLink (destination: MeetingView()) {
                    Label("ミーティングを開始", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                HStack {
                    Label("長さ", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes)分")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("テーマ", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("出席者")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
