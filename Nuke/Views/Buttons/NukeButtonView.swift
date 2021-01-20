//
//  Nuke.swift
//  Nuke
//
//  Created by Matthew Gleich on 1/18/21.
//

import SwiftUI

private struct NukeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(.title2))
            .foregroundColor(configuration.isPressed ? Color.red : Color.white)
            .background(configuration.isPressed ? Color.white : Color.red)
            .cornerRadius(6.0)
    }
}

struct NukeButtonView: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            Text(title)
                .padding()
                .frame(width: 100, height: 50)
        }).buttonStyle(NukeButtonStyle())
    }
}

struct NukeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NukeButtonView(title: "Nuke!", action: { print("Hello World!") })
    }
}
