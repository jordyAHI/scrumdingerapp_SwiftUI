/*
 See LICENSE folder for this sample’s licensing information.
 */


import SwiftUI

enum IronSuit: String, CaseIterable, Identifiable {
    case MarkI
    case MarkII
    case MarkIII
    case MarkIV
    case MarkV
    case MarkVI
    case MarkVII
    case MarkVIII
    case MarkIX
    case MarkX
    case MarkXI
    case MarkXII
    case MarkXIII
    case MarkXIV
    case MarkXV
    case MarkXXXII
    
    var accentColor: Color {
        return Color(.black)
    }
    var mainColor: Color {
        return Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
