//
//  AppDelegate.swift
//  HoverButtonDemo
//
//  Created by fancymax on 16/1/20.
//  Copyright © 2016年 fancy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    @IBOutlet weak var testBtn: HoverButton!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    
        let attrs = [NSForegroundColorAttributeName: NSColor.blue]
        testBtn.attributedStringValue = NSAttributedString(string: testBtn.stringValue, attributes: attrs)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

