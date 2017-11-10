//
//  StatusItemController.swift
//  PlayAways
//
//  Created by Guilherme Rambo on 08/12/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa

enum MenuOptions: Int {
    case iOS
    case macOS
    case tvOS
    case iOSWithPanel
    case macOSWithPanel
    case tvOSWithPanel
}

final class StatusItemController {
    
    private let menu: NSMenu = {
        let m = NSMenu(title: "PlayAlways")
        
        // New iOS Playground (with path selection)
        let newEmbeddedItem = NSMenuItem(title: NSLocalizedString("New iOS Playground...", comment: "New iOS Playgroud menu item with ellipsis"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "1")
        newEmbeddedItem.tag = MenuOptions.iOS.rawValue
        newEmbeddedItem.tag = MenuOptions.iOSWithPanel.rawValue
        m.addItem(newEmbeddedItem)
        
        
        // New iOS Playground
        let newEmbeddedItemAlternate = NSMenuItem(title: NSLocalizedString("New iOS Playground", comment: "New iOS Playgroud menu item (alternate)"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "1")
        
        newEmbeddedItemAlternate.isAlternate = true
        newEmbeddedItemAlternate.keyEquivalentModifierMask = [.command, .option]
        m.addItem(newEmbeddedItemAlternate)
        
        // New macOS Playground (with path selection)
        let newMacItem = NSMenuItem(title: NSLocalizedString("New macOS Playground...", comment: "New macOS Playgroud menu item with ellipsis"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "2")
        newMacItem.tag = MenuOptions.macOS.rawValue
        newMacItem.tag = MenuOptions.macOSWithPanel.rawValue
        m.addItem(newMacItem)
        
        
        // New macOS Playground
        let newMacItemAlternate = NSMenuItem(title: NSLocalizedString("New macOS Playground", comment: "New macOS Playgroud menu item (alternate)"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "2")
        
        newMacItemAlternate.isAlternate = true
        newMacItemAlternate.keyEquivalentModifierMask = [.command, .option]
        m.addItem(newMacItemAlternate)
        
        // New tvOS Playground  (with path selection)
        let newTVItem = NSMenuItem(title: NSLocalizedString("New tvOS Playground...", comment: "New tvOS Playgroud menu item with ellipsis"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "3")
        newTVItem.tag = MenuOptions.tvOS.rawValue
        newTVItem.tag = MenuOptions.tvOSWithPanel.rawValue
        m.addItem(newTVItem)
        
        // New tvOS Playground
        let newTVItemAlternate = NSMenuItem(title: NSLocalizedString("New tvOS Playground", comment: "New tvOS Playgroud menu item (alternate)"), action: #selector(AppDelegate.createNewPlayground(sender:)), keyEquivalent: "3")
        
        newTVItemAlternate.isAlternate = true
        newTVItemAlternate.keyEquivalentModifierMask = [.command, .option]
        m.addItem(newTVItemAlternate)
        
        // Separator
        m.addItem(NSMenuItem.separator())
        
        // Set Path
        let pathItem = NSMenuItem(title: NSLocalizedString("Set Path…", comment: "Set Path…"), action: #selector(AppDelegate.setPath(_:)), keyEquivalent: "p")
        m.addItem(pathItem)
        
        // Separator
        m.addItem(NSMenuItem.separator())

        // About
        let aboutItem = NSMenuItem(title: NSLocalizedString("About…", comment: "About…"),
                                   action: #selector(AppDelegate.about(_:)), keyEquivalent: "")
        m.addItem(aboutItem)
        
        // Quit
        let quitItem = NSMenuItem(title: NSLocalizedString("Quit", comment: "Quit"), action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        m.addItem(quitItem)
        
        return m
    }()
    
    private let statusItem: NSStatusItem
    
    init() {
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem.menu = menu
        statusItem.image = #imageLiteral(resourceName: "PlayAlways")
        statusItem.highlightMode = true
    }
    
}
