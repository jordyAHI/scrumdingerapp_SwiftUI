//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Jordy Yeoman on 18/2/2022.
//

import SwiftUI

struct IronSuitView: View {
    let ironSuit: IronSuit
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.pink)
                Label(ironSuit.name, systemImage: "bonjour")
                    .padding(4)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .textCase(.uppercase)
            }
            .foregroundColor(ironSuit.mainColor)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct IronSuitView_Previews: PreviewProvider {
    static var previews: some View {
        IronSuitView(ironSuit: .MarkXIV)
    }
}
