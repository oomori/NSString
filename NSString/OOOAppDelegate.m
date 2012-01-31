//
//  NSString
//
//  Created by Satoshi Oomori on 12/01/30.
//  Copyright (c) 2012 Satoshi Oomori . All rights reserved.
//  ARC ON

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

@synthesize fileString;

-(id)method001_UTF8String
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    
	cPointer = [str1 UTF8String];
    
    NSString *ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    
    NSLog(@"UTF8String %@",ret);
    
    return ret;    
}

#pragma mark initWithCString:encoding:
-(id)method002_initWithCString
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    
	cPointer = [str1 UTF8String];    
    NSString *ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    
    return ret;    
}

-(id)method003_initWithUTF8String
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
	cPointer = [str1 UTF8String];    
    NSString *ret = [[NSString alloc] initWithUTF8String:cPointer  ];
    
    return ret;    
}

-(NSUInteger)method004
{
    NSString *str1 = [NSString stringWithString:@"string"];
    NSUInteger len = [str1 length];
    return len;    
}


#pragma mark characterAtIndex
-(unichar)method005
{
    NSString *str1 = [NSString stringWithString:@"string"];
    unichar uniChar = [str1 characterAtIndex:3];
    return uniChar;    
}

#pragma mark initWithCharacters:length:
-(NSString *)method006
{
    const unichar myCharacters[] = {0x53C3,'x','x'};
    
    NSString *str1 = [[NSString alloc] initWithCharacters:myCharacters length:3];
    
    return str1;

}

#pragma mark getCharacters:length:
-(NSString *)method007
{
    
    unichar chr[7];

    NSString *str1 = [NSString stringWithString:@"string"];
    [str1 getCharacters:chr range:NSMakeRange(3,2)];
    
    NSString *str2 = [[NSString alloc] initWithCharacters:chr length:2];
    return str2;
    
}

#pragma mark cStringUsingEncoding:
-(NSString *)method008
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    NSString *ret ;
    
	cPointer = [str1 cStringUsingEncoding:NSASCIIStringEncoding];
     
    if ([str1 canBeConvertedToEncoding:NSASCIIStringEncoding]){
        ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    }
    else{
        ret = [NSString stringWithString:@"string"];
    }
    
    return ret;    
}

#pragma mark canBeConvertedToEncoding:
-(NSString *)method009
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    NSString *ret ;
    
	cPointer = [str1 cStringUsingEncoding:NSASCIIStringEncoding];
    
    if ([str1 canBeConvertedToEncoding:NSASCIIStringEncoding]){
        ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    }
    else{
        ret = [NSString stringWithString:@"string"];
    }
    
    return ret;    
}

#pragma mark initWithData:
- (void)displayText:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method010
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];

    //OpenPanelでファイル選択
    //この方法は10.6以降
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"Add torrent", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSData *dat = [NSData dataWithContentsOfURL: theDoc ];
            
            NSString *output = [[NSString alloc] initWithData:dat encoding:NSASCIIStringEncoding];
            
            
            [self performSelectorOnMainThread:@selector(displayText:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}

#pragma mark dataUsingEncoding:
-(NSString *)method011
{
	NSString *str1 = [NSString stringWithString:@"string"];
    NSData *dat = [str1 dataUsingEncoding:NSASCIIStringEncoding] ;
    NSString *ret ;
       
    if ([str1 canBeConvertedToEncoding:NSASCIIStringEncoding]){
        ret = [[NSString alloc] initWithData:dat encoding:NSASCIIStringEncoding  ];
    }
    else{
        ret = [NSString stringWithString:@"string"];
    }
    
    return ret;    
}

#pragma mark stringByAddingPercentEscapesUsingEncoding:
-(NSString *)method012
{
	NSString *str1 = [NSString stringWithString:@"aaa bbb"];
    NSString *str2 = [str1 stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding] ;
    
    NSLog(@"str1 %@,str2 %@",str1,str2);
    
    NSString *ret = [str1 stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    
    return ret;    
}

#pragma mark stringByAddingPercentEscapesUsingEncoding:
-(NSString *)method013
{
	NSString *str1 = [NSString stringWithString:@"aaa bbb"];
    NSString *str2 = [str1 stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding] ;
    
    NSLog(@"str1 %@,str2 %@",str1,str2);
    
    NSString *ret = [str1 stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    
    return ret;    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"test001 %@",    [self method001_UTF8String]);
    NSLog(@"test002 %@",    [self method002_initWithCString]);
    NSLog(@"test003 %@",    [self method003_initWithUTF8String]);
    NSLog(@"test004 %lu",   [self method004]);//length
    NSLog(@"test005 %hu",   [self method005]);
    NSLog(@"test006 %@",    [self method006]);
    NSLog(@"test007 %@",    [self method007]);    
    NSLog(@"test008 %@",    [self method008]);
    NSLog(@"test009 %@",    [self method009]);
    //[self method010];
    NSLog(@"test011 %@",    [self method011]);
    
    NSLog(@"test012 %@",    [self method012]);
    
    NSLog(@"test013 %@",    [self method013]);
    
}

@end
