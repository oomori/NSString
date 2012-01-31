//
//  OOOAppDelegate.h
//  NSString
//
//  Created by 大森 智史 on 12/01/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OOOAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) IBOutlet NSWindow *window;
@property (assign) NSString *fileString;

-(id)method001_UTF8String;
-(id)method002_initWithCString;
-(id)method003_initWithUTF8String;
-(NSUInteger)method004;
-(unichar)method005;
-(NSString *)method006;
-(NSString *)method007;

-(NSString *)method008;

-(NSString *)method009;

-(void)method010;
-(NSString *)method011;
@end
