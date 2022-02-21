//
//  DailyScrumVM.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import Foundation
import SwiftUI

class DailyScrumVM: ObservableObject {
     var scrum: Binding<DailyScrum>
    @State private var data : DailyScrum.Data
    
    init(scrum: Binding<DailyScrum>) {
       data = DailyScrum.Data()
        self.scrum = scrum
    }
    
    func createAttendee(newAttendeeName: String) {
        let attendee = DailyScrum.Attendee(name: newAttendeeName)
        self.data.attendees.append(attendee)
    }
    
    func updateDailyScrum(data: DailyScrum.Data) {
        
    }
}
