//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 17/2/2022.
//

import SwiftUI

struct DetailEditView: View {
    // State variable -
    @Binding var scrum: DailyScrum
    @Binding var data: DailyScrum.Data
    @State private var newAttendeeName = ""
    @ObservedObject var scrumVM : DailyScrumVM
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                // $data.title is binding to the data property declared above, this way we
                // Can override the .title property
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 1...60, step: 1) {
                       Text("Length")
                   }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    .accentColor(data.theme.mainColor)
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
               }
                ThemePicker(selection: $data.theme)
                IronSuitPicker(selection: $data.ironSuit)
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                        Text(attendee.name)
                    }
                    .onDelete { indices in
                        data.attendees.remove(atOffsets: indices)
                    }
                HStack {
                   TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                       withAnimation {
                           scrumVM.createAttendee(newAttendeeName: newAttendeeName)
                           //let attendee = DailyScrum.Attendee(name: newAttendeeName)
                           //data.attendees.append(attendee)
                           newAttendeeName = ""
                       }
                   }) {
                       Image(systemName: "plus.circle.fill")
                           .accessibilityLabel("Add attendee")
                   }
                   .disabled(newAttendeeName.isEmpty)
               }
            }
        }
    }
}

//struct DetailEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
//    }
//}
