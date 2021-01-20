//
//  QuitButtonView.swift
//  Nuke
//
//  Created by Matthew Gleich on 1/18/21.
//

import SwiftUI

struct QuitButtonView: View {
    var body: some View {
        Button(action: {
            NSApplication.shared.terminate(self)
        }, label: {
            Text("Quit Nuke")
                .foregroundColor(.white)
        })
    }
}

struct QuitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        QuitButtonView()
    }
}
