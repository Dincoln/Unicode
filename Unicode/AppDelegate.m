//
//  AppDelegate.m
//  Unicode
//
//  Created by Dincoln on 2017/4/7.
//  Copyright © 2017年 Dincoln. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NSApplicationDelegate,NSWindowDelegate>

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [NSApp setDelegate:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow:)name:NSWindowWillCloseNotification object:nil];
}
- (void)closeWindow:(NSWindow *)window{
    
    [NSApp terminate:self];
    
}
    

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)windowShouldClose:(id)sender{
    [NSApp terminate:self];
    return YES;

}
@end
