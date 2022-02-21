import SwiftUI

struct IronSuitPicker: View {
    @Binding var selection: IronSuit
    var body: some View {
        Picker("IronSuit", selection: $selection) {
            ForEach(IronSuit.allCases) { ironSuit in
                IronSuitView(ironSuit: ironSuit)
                    .tag(ironSuit)
                    .padding(10)
            }
        }
    }
}

struct IronSuitPicker_Previews: PreviewProvider {
    static var previews: some View {
        IronSuitPicker(selection: .constant(.MarkXIV))
    }
}
