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
    @StateObject var scrumVM : DailyScrumVM
    
    init() {
        scrumVM = DailyScrumVM(scrum: <#Binding<DailyScrum>#>scrum: <#Binding<DailyScrum>#>)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}

