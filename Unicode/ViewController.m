//
//  ViewController.m
//  Unicode
//
//  Created by Dincoln on 2017/4/7.
//  Copyright © 2017年 Dincoln. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.text1.textColor = [NSColor blackColor];
    self.text1.delegate = self;
    self.text2.textColor = [NSColor blackColor];
    self.text2.delegate = self;
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)btn:(id)sender {
    
    self.text2.string = [self replaceUnicode:self.text1.string];
}

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:nil error:nil];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

- (void)textDidChange:(NSNotification *)notification{
    if (notification.object == self.text1) {
        self.text1.textColor = [NSColor darkGrayColor];
        [self btn:nil];
    }
    if (notification.object == self.text2) {
        self.text2.textColor = [NSColor darkGrayColor];
        self.text2.font = [NSFont systemFontOfSize:14];
    }
    self.text2.font = [NSFont systemFontOfSize:14];
    self.text1.font = [NSFont systemFontOfSize:14];

}

@end
