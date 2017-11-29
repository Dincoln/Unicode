//
//  ViewController.h
//  Unicode
//
//  Created by Dincoln on 2017/4/7.
//  Copyright © 2017年 Dincoln. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTextDelegate>
@property (unsafe_unretained) IBOutlet NSTextView *text1;
@property (unsafe_unretained) IBOutlet NSTextView *text2;

@end

