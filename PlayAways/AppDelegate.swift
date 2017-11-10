//
//  AppDelegate.swift
//  PlayAways
//
//  Created by Guilherme Rambo on 08/12/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var extensionHandler: ExtensionHandler!
    private var router: AppRouter!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.router = AppRouter(
            statusItemController: StatusItemController(),
            playgroundMaker: PlayAlwaysMaker(),
            persistence: PersistenceHelper(storage: UserDefaults.standard)
        )
        
        self.extensionHandler = ExtensionHandler(router: router)
    }
    
    @IBAction func createNewPlayground(sender: NSMenuItem) {
        guard let options = MenuOptions(rawValue: sender.tag) else {
            NSLog("Unexpected menu option \(sender.tag), this should not happen")
            return
        }
        
        router.createPlayground(with: options)
    }
    
    @IBAction func setPath(_ sender: NSMenuItem) {
        _ = router.storageLocationShowingPanelIfNeeded(force: true)
    }
    
    @IBAction func about(_ sender: NSMenuItem) {
        if let aboutURL = URL(string: "https://github.com/Krishna/PlayAlways") {
            NSWorkspace.shared().open(aboutURL)
        } else {
            NSLog("Invalid About URL specified.")
        }
    }
}

