//
//  DailyScrumVM.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import Foundation
import SwiftUI

class DailyScrumVM: ObservableObject {
    @Published var data = DailyScrum.Data()
    @Published var scrum = DailyScrum()
    
    func createAttendee(newAttendeeName: String) {
        let attendee = DailyScrum.Attendee(name: newAttendeeName)
        data.attendees.append(attendee)
    }
    
    func updateDailyScrum() {
        scrum.update(from: scrum.data)
    }
}
