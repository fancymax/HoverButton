//
//  HoverButton.swift
//  HoverButtonDemo
//
//  Created by fancymax on 16/1/20.
//  Copyright © 2016年 fancy. All rights reserved.
//

import Cocoa

class HoverButton: NSButton{
    var backgroundColor: NSColor?
    var hoveredBackgroundColor: NSColor?
    var pressedBackgroundColor: NSColor?
    
    private var hovered: Bool = false
    
    override var wantsUpdateLayer:Bool{
        return true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.commonInit()
    }
    
    func commonInit(){
        self.wantsLayer = true
        self.createTrackingArea()
        self.hovered = false
        self.hoveredBackgroundColor = NSColor.selectedTextBackgroundColor()
        self.pressedBackgroundColor = NSColor.selectedTextBackgroundColor()
        self.backgroundColor = NSColor.clearColor()
    }
    
    private var trackingArea: NSTrackingArea!
    func createTrackingArea(){
        if(self.trackingArea != nil){
            self.removeTrackingArea(self.trackingArea!)
        }
        let circleRect = self.bounds
        let flag = NSTrackingAreaOptions.MouseEnteredAndExited.rawValue + NSTrackingAreaOptions.ActiveInActiveApp.rawValue
        self.trackingArea = NSTrackingArea(rect: circleRect, options: NSTrackingAreaOptions(rawValue: flag), owner: self, userInfo: nil)
        self.addTrackingArea(self.trackingArea)
    }
    
    override func mouseEntered(theEvent: NSEvent) {
        self.hovered = true
        NSCursor.pointingHandCursor().set()
        self.needsDisplay = true
    }
    
    override func mouseExited(theEvent: NSEvent) {
        self.hovered = false
        NSCursor.arrowCursor().set()
        self.needsDisplay = true
    }
    
    override func updateLayer() {
        if(hovered){
            if (self.cell!.highlighted){
                self.layer?.backgroundColor = pressedBackgroundColor?.CGColor
            }
            else{
                self.layer?.backgroundColor = hoveredBackgroundColor?.CGColor
            }
        }
        else{
            self.layer?.backgroundColor = backgroundColor?.CGColor
        }
        
        Swift.print("updateLayer")
    }
}
