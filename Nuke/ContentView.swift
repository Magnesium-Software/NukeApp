//
//  ContentView.swift
//  Nuke
//
//  Created by Matthew Gleich on 12/28/20.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    let width = CGFloat(300)
    let height = CGFloat(180)

    var body: some View {
        VStack {
            NukeButtonView(title: "NUKE", action: {
                let closedApps = closeApps()
                sendNotification(closedApps)
            })

            QuitButtonView()
        }.frame(width: width, height: height)
    }

    private func closeApps() -> Int {
        let workspace = NSWorkspace.shared
        let openApps = workspace.runningApplications

        var closedApps = 0
        for app in openApps where app.activationPolicy == .regular {
            app.forceTerminate()
            closedApps += 1
        }
        return closedApps
    }

    private func sendNotification(_ numberOfApps: Int) {
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
