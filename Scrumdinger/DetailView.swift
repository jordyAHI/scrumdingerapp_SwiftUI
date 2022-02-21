/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    @State private var isPresentingEditView = false
    @ObservedObject var scrumVM = DailyScrumVM()
    
    init(scrum: DailyScrum) {
        self.scrumVM.scrum = scrum
        self.scrumVM.data = scrum.data
    }
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrumVM.scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrumVM.scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrumVM.scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrumVM.scrum.theme.accentColor)
                        .background(scrumVM.scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Ironman Suit", systemImage: "bonjour")
                    Spacer()
                    Text(scrumVM.scrum.ironSuit.name)
                        .fontWeight(Font.Weight.semibold)
                        .padding(4)
                        .textCase(.uppercase)
                        .foregroundColor(scrumVM.scrum.ironSuit.accentColor)
                        .background(scrumVM.scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrumVM.data.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrumVM.scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(scrumVM: scrumVM)
                    .navigationTitle(scrumVM.scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrumVM.updateDailyScrum()
                            }
                        }
                    }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
//        }
//    }
//}
