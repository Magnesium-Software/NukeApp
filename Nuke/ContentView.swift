//
//  ContentView.swift
//  Nuke
//
//  Created by Matthew Gleich on 12/28/20.
//

import SwiftUI
import UserNotifications

struct NukeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.red : Color.white)
            .background(configuration.isPressed ? Color.white : Color.red)
            .cornerRadius(6.0)
            .padding()
    }
}

struct ContentView: View {
    let width = CGFloat(130)
    let height = CGFloat(150)

    var body: some View {
        VStack {
            // Main nuke button
            Button(action: {
                let workspace = NSWorkspace.shared
                let openApps = workspace.runningApplications

                var closedApps = 0
                for app in openApps where app.activationPolicy == .regular {
                    app.forceTerminate()
                    closedApps += 1
                }
                sendNotification(closedApps)

            }, label: {
                Text("NUKE!")
            }).buttonStyle(NukeButtonStyle())

            // Quit  nuke button
            Button(action: {
                NSApplication.shared.terminate(self)
            }, label: {
                Text("Quit Nuke")
            })
        }.frame(width: width, height: height)
    }

    func sendNotification(_ numberOfApps: Int) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

        let content = UNMutableNotificationContent()
        content.title = "Force closed \(numberOfApps) app"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
