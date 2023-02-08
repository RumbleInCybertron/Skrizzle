//
//  SkrizzleApp.swift
//  Skrizzle
//
//  Created by Derek Haus on 2023/02/06.
//

import SwiftUI

@main
struct SkrizzleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
