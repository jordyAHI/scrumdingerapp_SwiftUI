/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var ironSuit: IronSuit
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme, ironSuit: IronSuit) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        self.ironSuit = ironSuit
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
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
        var ironSuit: IronSuit = .MarkXIII
    }
    // Computed property
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme, ironSuit: ironSuit)
        }
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
        ironSuit = data.ironSuit
    }
    
}

extension DailyScrum {
    static var sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Designers", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow, ironSuit: .MarkXIV),
        DailyScrum(title: "App Devs", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange, ironSuit: .MarkXXXII),
        DailyScrum(title: "Web Devs", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy, ironSuit: .MarkII),
        DailyScrum(title: "Backend Devs", attendees: ["Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 2, theme: .buttercup, ironSuit: .MarkXII),
        DailyScrum(title: "Meth Engineers", attendees: ["Jordy", "Sean", "Rob", "FelonBronks", "Jenn", "Sarah"], lengthInMinutes: 12, theme: .sky, ironSuit: .MarkIV),
        DailyScrum(title: "Database Engineers", attendees: ["Jordy", "Sean", "Rob", "FelonBronks", "Jenn", "Sarah"], lengthInMinutes: 2, theme: .bubblegum, ironSuit: .MarkVIII),
        DailyScrum(title: "Crystal Creators", attendees: ["Jordy", "Sean", "Rob", "FelonBronks", "Jenn", "Sarah"], lengthInMinutes: 2, theme: .indigo, ironSuit: .MarkIII),
        DailyScrum(title: "Shakra Aligners", attendees: ["Jordy", "Sean", "Rob", "FelonBronks", "Jenn", "Sarah"], lengthInMinutes: 2, theme: .navy, ironSuit: .MarkX),
        DailyScrum(title: "Designer", attendees: ["Jonathan"], lengthInMinutes: 10, theme: .yellow, ironSuit: .MarkXXXII),
        DailyScrum(title: "App Dev", attendees: ["Darla"], lengthInMinutes: 5, theme: .orange, ironSuit: .MarkXV),
        DailyScrum(title: "Web Dev", attendees: ["Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy, ironSuit: .MarkVI),
        DailyScrum(title: "Backend Dev", attendees: ["Sarah"], lengthInMinutes: 2, theme: .buttercup, ironSuit: .MarkXIV),
        DailyScrum(title: "Meth Engineer", attendees: ["Jordy"], lengthInMinutes: 12, theme: .sky, ironSuit: .MarkIX),
        DailyScrum(title: "Database Engineer", attendees: ["FelonBronks"], lengthInMinutes: 2, theme: .bubblegum, ironSuit: .MarkX),
        DailyScrum(title: "Crystal Creator", attendees: ["Robin"], lengthInMinutes: 2, theme: .indigo, ironSuit: .MarkXII),
        DailyScrum(title: "Shakra Aligner", attendees: ["Sean"], lengthInMinutes: 2, theme: .navy, ironSuit: .MarkVIII),
    ]
}
