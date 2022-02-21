//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 17/2/2022.
//

import SwiftUI

struct DetailEditView: View {
    // State variable -
    @State private var newAttendeeName = ""
    @ObservedObject var scrumVM : DailyScrumVM
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                // $data.title is binding to the data property declared above, this way we
                // Can override the .title property
                TextField("Title", text: $scrumVM.data.title)
                HStack {
                    Slider(value: $scrumVM.data.lengthInMinutes, in: 1...60, step: 1) {
                       Text("Length")
                   }
                    .accessibilityValue("\(Int(scrumVM.data.lengthInMinutes)) minutes")
                    .accentColor(scrumVM.data.theme.mainColor)
                    Spacer()
                    Text("\(Int(scrumVM.data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
               }
                ThemePicker(selection: $scrumVM.data.theme)
                IronSuitPicker(selection: $scrumVM.data.ironSuit)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrumVM.data.attendees) { attendee in
                        Text(attendee.name)
                    }
                    .onDelete { indices in
                        scrumVM.data.attendees.remove(atOffsets: indices)
                    }
                HStack {
                   TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                       withAnimation {
                           scrumVM.createAttendee(newAttendeeName: newAttendeeName)
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
