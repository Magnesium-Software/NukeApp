//
//  ViewController.swift
//  Nuke
//
//  Created by Matthew Gleich on 12/27/20.
//

import Cocoa

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func nukePressed(_ sender: NSButton) {
        let workspace = NSWorkspace.shared
        let openApps = workspace.runningApplications.filter { $0.activationPolicy == .regular }

        print("Hello World!")
        for app in openApps {
            if app.localizedName ?? "" == "Finder" {
                continue
            }

            if !app.forceTerminate() {
                print("Closed \(app.localizedName)")
            }
        }
    }
}
