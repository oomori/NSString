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


- (NSString *)stringByAppendingFormat:(NSString *)format, ... ;

-(id)method001;
-(id)method002;
-(id)method003;
-(NSUInteger)method004;
-(unichar)method005;
-(NSString *)method006;
-(NSString *)method007;

-(NSString *)method008;

-(NSString *)method009;

-(void)method010;
-(NSString *)method011;
-(NSString *)method012;
-(NSString *)method013;
-(NSString *)method014;

-(NSString *)method015;

-(void)method016;

-(void)method017;

-(NSString *)method018;

-(NSString *)method019;


@end
