//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 15/2/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}

