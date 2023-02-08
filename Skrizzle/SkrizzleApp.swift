//
//  SkrizzleApp.swift
//  Skrizzle
//
//  Created by Derek Haus on 2023/02/06.
//

import SwiftUI

@main
struct SkrizzleApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
