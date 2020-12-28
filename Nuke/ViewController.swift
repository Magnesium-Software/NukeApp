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
        print("Hello World!")
    }
}
