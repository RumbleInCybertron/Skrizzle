//
//  DailyScrum.swift
//  Skrizzle
//
//  Created by Derek Haus on 2023/02/06.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 10
        var theme: Theme = .bubblegum
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme )
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "デザイン", attendees: ["ユナカ","ソラ","クロエ","ヴェイル"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "アプリ開発", attendees: ["パンドラ","モーヴ","ロイ","カムイ"], lengthInMinutes: 5, theme: .poppy),
        DailyScrum(title: "ヴェブ開発", attendees: ["ラピス","アイク","フラン","クラン","クロード"], lengthInMinutes: 5, theme: .orange)
    ]
}
