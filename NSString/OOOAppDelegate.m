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

#pragma mark string
-(NSString *)method014
{
	NSMutableString *str1 = [NSMutableString string];
    [str1 appendString:@"---string"];
    
    NSLog(@"str1 %@",str1);
    
    return str1;    
}

#pragma mark init
-(NSString *)method015
{
	NSMutableString *str1 = [[NSMutableString alloc] init];
    [str1 appendString:@"---string"];
    
    NSLog(@"str1 %@",str1);
    
    return str1;    
}

#pragma mark initWithBytes:length:encoding:
- (void)displayText016:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method016
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSData *dat = [NSData dataWithContentsOfURL: theDoc ];
            
            NSString *output = [[NSString alloc] initWithBytes:[dat bytes]
                                                        length:[dat length]
                                                      encoding:NSShiftJISStringEncoding];
            [self performSelectorOnMainThread:@selector(displayText016:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}

#pragma mark initWithBytesNoCopy:length:encoding:freeWhenDone:
- (void)displayText017:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method017
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSData *dat = [NSData dataWithContentsOfURL: theDoc ];

            
            NSString *output = [[NSString alloc] initWithBytesNoCopy:(void *)[dat bytes]
                                                        length:[dat length]
                                                      encoding:NSShiftJISStringEncoding
                                                        freeWhenDone:NO ];
            
            [self performSelectorOnMainThread:@selector(displayText017:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}
#pragma mark initWithCharacters:length:
-(NSString *)method006
{
    const unichar myCharacters[] = {0x53C3,'x','x'};
    
    NSString *str1 = [[NSString alloc] initWithCharacters:myCharacters length:3];
    
    return str1;
    
}

#pragma mark initWithCharactersNoCopy:length:freeWhenDone:
-(NSString *)method018
{
    //
    NSString *string = [NSString stringWithString:@"string"];
    unichar* buffer = (unichar*)malloc([string length]);
    for (int i = 0; i < [string length]; ++ i)
    {
        unichar chr = [string characterAtIndex:i];
        buffer[i] = chr;
    }
    
    buffer[2] = 0x8723;
    
    NSString *str1 = [[NSString alloc] initWithCharactersNoCopy:buffer length:[string length] freeWhenDone:YES];
    
    
    return str1;
    
    //->test018 st蜣ing
}

#pragma mark initWithString:
-(NSString *)method019
{
	NSString *str1 = [[NSString alloc] initWithString:@"string"];
    
    return str1;    
}

#pragma mark initWithCString:encoding:
-(id)method002
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    
	cPointer = [str1 UTF8String];    
    NSString *ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    
    return ret;    
}

#pragma mark UTF8String
-(id)method001
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    
	cPointer = [str1 UTF8String];
    
    NSString *ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    
    NSLog(@"UTF8String %@",ret);
    
    return ret;    
}



#pragma mark initWithUTF8String:
-(id)method003
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
	cPointer = [str1 UTF8String];    
    NSString *ret = [[NSString alloc] initWithUTF8String:cPointer  ];
    
    return ret;    
}

#pragma mark initWithFormat:
-(NSString *)method020
{
	NSString *str1 = [[NSString alloc] initWithFormat:@"int%d",10];
    
    return str1;    
}

#pragma mark initWithFormat:arguments:
- (NSString *)stringByAppendingFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString * result = [[NSString alloc ]initWithFormat:format arguments:args];
    va_end(args);
    return result;
}

-(NSString *)method021
{
    NSString *aString = [self stringByAppendingFormat:@"%@ %s %.2f",@"2","3",200.344,nil];
    
    return aString;    
}

#pragma mark initWithFormat:locale:
-(NSString *)method022
{
    //change separator
    NSDictionary *dic= [[NSDictionary alloc] initWithObjectsAndKeys:
                        @"!",@"NSDecimalSeparator",//小数点区切り
                        nil];             
    
	NSString *aString = [[NSString alloc] initWithFormat:@"%@: %.2f\n" locale:dic,@"aaa",100.111];
    
    
    return aString;    
}

#pragma mark initWithFormat:locale:arguments:
- (NSString *)stringByAppendingFormat002:(NSString *)format, ... {
    //change separator
    NSDictionary *dic= [[NSDictionary alloc] initWithObjectsAndKeys:
                        @"!",@"NSDecimalSeparator",//separator
                        nil];             
    va_list args;
    va_start(args, format);
    NSString * result = [[NSString alloc ]initWithFormat:format locale:dic arguments:args];
    va_end(args);
    return result;
}

-(NSString *)method023
{
    NSString *aString = [self stringByAppendingFormat002:@"%@ %s %.2f",@"2","a",200.344,nil];
    
    return aString;    
}

#pragma mark initWithData:encoding:
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
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
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

#pragma mark stringWithFormat:
-(NSString *)method024
{
	NSString *str1 = [NSString stringWithFormat:@"int%d",10];
    
    return str1;    
}

#pragma mark localizedStringWithFormat:
-(NSString *)method025
{
    //If the locale is en_US ...2 a 200.34 
    //If the locale is fr_FR ...2 a 200,34
    
	NSString *str1 = [NSString localizedStringWithFormat:@"%@ %s %.2f",@"2","a",200.344,nil];
    
    return str1;    
}

#pragma mark stringWithCharacters:
-(NSString *)method026
{
	
    const unichar chr[] = {0x53C3,'x','x'};
    
    NSString *str1 = [NSString stringWithCharacters:(const unichar *)&chr length:3];
    
    return str1;    
}



#pragma mark stringWithString:
-(NSUInteger)method004
{
    NSString *str1 = [NSString stringWithString:@"string"];
    NSUInteger len = [str1 length];
    return len;    
}

#pragma mark stringWithCString:encoding:
-(NSString *)method027
{
	
    NSString *str1 = [NSString stringWithCString:"string"
                                             encoding: NSASCIIStringEncoding];
	
    
    return str1;    
}

#pragma mark stringWithUTF8String:
-(NSString *)method028
{
	
    NSString *str1 = [NSString stringWithUTF8String:"\123\124"];
	
    
    return str1;    
}

#pragma mark stringWithContentsOfFile:encoding:error:
- (void)displayText029:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method029
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSString *output = [NSString stringWithContentsOfFile:[theDoc path] encoding: NSASCIIStringEncoding
                                                            error: &error];
            [self performSelectorOnMainThread:@selector(displayText029:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}
#pragma mark initWithContentsOfFile:encoding:error:
- (void)displayText030:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method030
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"Select", nil)];
    [opPanel setMessage:@"Please select ASCII text."];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSString *output = [[NSString alloc] initWithContentsOfFile:[theDoc path] encoding: NSASCIIStringEncoding
                                                            error: &error];
            [self performSelectorOnMainThread:@selector(displayText030:) withObject:output waitUntilDone:NO];
        }
    }];
}

#pragma mark stringWithContentsOfFile:usedEncoding:error:
- (void)displayText031:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method031
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSStringEncoding encoding = 0;
            
            NSString *output = [NSString stringWithContentsOfFile:[theDoc path] usedEncoding: &encoding
                                                            error: &error];
            [self performSelectorOnMainThread:@selector(displayText031:) withObject:output waitUntilDone:NO];
            
  
            
            switch (encoding) {
                case NSASCIIStringEncoding:
                    NSLog(@"NSASCIIStringEncoding");
                    break;
                case NSNEXTSTEPStringEncoding:
                    NSLog(@"NSNEXTSTEPStringEncoding");
                    break;
                case NSJapaneseEUCStringEncoding:
                    NSLog(@"NSJapaneseEUCStringEncoding");
                    break;
                case NSUTF8StringEncoding:
                    NSLog(@"NSUTF8StringEncoding");
                    break;    
                default:
                    NSLog(@"%lu",encoding);
                    break;
            }
            
        }
    }];
    
    
}
#pragma mark initWithContentsOfFile:usedEncoding:error:
- (void)displayText032:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method032
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSStringEncoding encoding = 0;
            
            NSString *output = [[NSString alloc] initWithContentsOfFile:[theDoc path] usedEncoding: &encoding
                                                            error: &error];
            [self performSelectorOnMainThread:@selector(displayText032:) withObject:output waitUntilDone:NO];
            
            
            
            switch (encoding) {
                case NSASCIIStringEncoding:
                    NSLog(@"NSASCIIStringEncoding");
                    break;
                case NSNEXTSTEPStringEncoding:
                    NSLog(@"NSNEXTSTEPStringEncoding");
                    break;
                case NSJapaneseEUCStringEncoding:
                    NSLog(@"NSJapaneseEUCStringEncoding");
                    break;
                case NSUTF8StringEncoding:
                    NSLog(@"NSUTF8StringEncoding");
                    break;    
                default:
                    NSLog(@"%lu",encoding);
                    break;
            }
            
        }
    }];
    
    
}
#pragma mark stringWithContentsOfURL:encoding:error:
- (void)displayText033:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method033
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theURL = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSString *output = [NSString stringWithContentsOfURL:theURL encoding: NSASCIIStringEncoding
                                                            error: &error];
            [self performSelectorOnMainThread:@selector(displayText033:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}
#pragma mark initWithContentsOfURL:encoding:error:
- (void)displayText034:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method034
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theURL = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSString *output = [[NSString alloc] initWithContentsOfURL:theURL encoding: NSASCIIStringEncoding
                                                           error: &error];
            [self performSelectorOnMainThread:@selector(displayText034:) withObject:output waitUntilDone:NO];
            
        }
    }];
    
    
}

#pragma mark  +stringWithContentsOfURL:usedEncoding:error:
- (void)displayText035:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method035
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theURL = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSStringEncoding encoding = 0;
            
            NSString *output = [NSString stringWithContentsOfURL:theURL
                                                    usedEncoding: &encoding                       error: &error];
            [self performSelectorOnMainThread:@selector(displayText035:) withObject:output waitUntilDone:NO];
            
            
            
            switch (encoding) {
                case NSASCIIStringEncoding:
                    NSLog(@"NSASCIIStringEncoding");
                    break;
                case NSNEXTSTEPStringEncoding:
                    NSLog(@"NSNEXTSTEPStringEncoding");
                    break;
                case NSJapaneseEUCStringEncoding:
                    NSLog(@"NSJapaneseEUCStringEncoding");
                    break;
                case NSUTF8StringEncoding:
                    NSLog(@"NSUTF8StringEncoding");
                    break;    
                default:
                    NSLog(@"%lu",encoding);
                    break;
            }
            
            
        }
    }];
    
    
}
#pragma mark  -initWithContentsOfURL:usedEncoding:error:
- (void)displayText036:(NSString *)text {
	self.fileString = text;
    NSLog(@"text %@",text);
}
-(void)method036
{
    //FileSystem programming guide
    //http://developer.apple.com/library/ios/#DOCUMENTATION/FileManagement/Conceptual/FileSystemProgrammingGUide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html
    
    
    //OpenPanelを作る
    NSOpenPanel  *opPanel       = [ NSOpenPanel openPanel ];
    
    //OpenPanelでファイル選択
    //This way is 10.6 or later
    [opPanel setCanChooseDirectories:YES];
    [opPanel setAllowsMultipleSelection:YES];
    [opPanel setPrompt:NSLocalizedString(@"prompt text", nil)];
    [opPanel setMessage:@"Message"];
    
    [opPanel beginWithCompletionHandler:^(NSInteger result){
        
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theURL = [[opPanel URLs] objectAtIndex:0];
            
            // Open  the document.
            NSError *error = nil;
            NSStringEncoding encoding = 0;
            
            NSString *output = [[NSString alloc] initWithContentsOfURL:theURL
                                                    usedEncoding: &encoding                       error: &error];
            [self performSelectorOnMainThread:@selector(displayText036:) withObject:output waitUntilDone:NO];
            
            
            
            switch (encoding) {
                case NSASCIIStringEncoding:
                    NSLog(@"NSASCIIStringEncoding");
                    break;
                case NSNEXTSTEPStringEncoding:
                    NSLog(@"NSNEXTSTEPStringEncoding");
                    break;
                case NSJapaneseEUCStringEncoding:
                    NSLog(@"NSJapaneseEUCStringEncoding");
                    break;
                case NSUTF8StringEncoding:
                    NSLog(@"NSUTF8StringEncoding");
                    break;    
                default:
                    NSLog(@"%lu",encoding);
                    break;
            }
            
            
        }
    }];
    
    
}
#pragma mark writeToFile:writeToFile:atomically:encoding:error:
-(BOOL)method037
{
    ////NOTICE !!! computer will write write to "~/Desktop/testWrite_NSString_method037.txt" file without alert.
    NSString *writeFilePath = @"~/Desktop/testWrite_NSString_method037.txt";
    NSString *theString = @"method037での書き込みです。";
    NSError *anError = nil;

    return [theString writeToFile:[writeFilePath stringByExpandingTildeInPath] atomically:YES encoding:NSUTF8StringEncoding error:&anError];    
}
#pragma mark writeToURL:writeToFile:atomically:encoding:error:
-(BOOL)method038
{
    ////NOTICE !!! computer will write to "~/Desktop/testWrite_NSString_method038.txt" file without alert.
    NSString *writeFilePath = @"~/Desktop/testWrite_NSString_method038.txt";
    NSURL *url = [[NSURL alloc] initFileURLWithPath:[writeFilePath stringByExpandingTildeInPath]];
    
    
    NSString *theString = @"method038での書き込みです。";
    NSError *anError = nil;
    
    return [theString writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&anError];    
}

#pragma mark length
-(NSUInteger)method039
{
    NSString *str1 = [NSString stringWithString:@"string"];
    NSUInteger stringLength = [str1 length];
    return stringLength;    
}

#pragma mark lengthOfBytesUsingEncoding:
-(NSUInteger)method040
{
    NSString *str1 = [NSString stringWithString:@"Unicode文字列の長さです。"];
    NSUInteger stringLength = [str1 lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    return stringLength;    
}

#pragma mark maximumLengthOfBytesUsingEncoding:
-(NSUInteger)method041
{
    NSString *str1 = [NSString stringWithString:@"Unicode文字列の長さです。"];
    NSUInteger stringLength = [str1 maximumLengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    return stringLength;    
}

#pragma mark characterAtIndex
-(unichar)method005
{
    NSString *str1 = [NSString stringWithString:@"string"];
    unichar uniChar = [str1 characterAtIndex:3];
    return uniChar;    
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
#pragma mark getBytes:maxLength:usedLength:encoding:options:range:remainingRange::
-(void)method042
{
    
    
    
    NSString *aString = @"the string";
     char chrBuffer[72];
    NSRange aRange = NSMakeRange(0,72);
    [aString getBytes:chrBuffer maxLength:72 
           usedLength:NULL 
             encoding:NSASCIIStringEncoding 
              options:NSStringEncodingConversionExternalRepresentation 
                range:aRange 
       remainingRange:NULL];
    NSLog(@"%s",chrBuffer); 

    
}

#pragma mark getCharacters:
-(NSString *)method043
{
    NSString *aString = [NSString stringWithString:@"string"];
    NSUInteger length = [aString length];
    unichar inputChars[length + 1]; 
    [aString getCharacters:inputChars];
    
    NSString *str1 = [[NSString alloc] initWithCharacters:inputChars length:3];
 
    return str1;
    
    
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

#pragma mark getCString:maxLength:encoding:
-(NSString *)method044
{
    NSString *theString = @"the string";
    char chrBuffer[99];
    [theString getCString:chrBuffer maxLength:99 encoding:NSASCIIStringEncoding];
    	
    NSString *ret = [[NSString alloc] initWithCString:chrBuffer 
                                             encoding:NSASCIIStringEncoding  ];
    
    
    return ret;    
}

#pragma mark UTF8String
-(NSString *)method045
{
    const char *cPointer;
	NSString *str1 = [NSString stringWithString:@"string"];
    
	cPointer = [str1 UTF8String];    
    NSString *ret = [[NSString alloc] initWithCString:cPointer encoding:NSASCIIStringEncoding  ];
    
    return ret;    
}

#pragma mark stringByAppendingFormat:
-(NSString *)method046
{
	NSString *str1 = [[NSString alloc] initWithFormat:@"aaa %@",@"bbb"];
    NSString *str2 = [str1 stringByAppendingFormat:@" add%d",10];
    
    return str2;    
}



#pragma mark stringByAppendingString:
-(NSString *)method047
{
	NSString *str1 = [[NSString alloc] initWithFormat:@"aaa %@",@"bbb"];
    NSString *str2 = [str1 stringByAppendingString:@" ccc"];
    
    return str2;    
}

#pragma mark stringByPaddingToLength:
-(NSString *)method048
{
	NSString *str1 = [[NSString alloc] initWithString:@"string"];
    NSString *str2 = [str1 stringByPaddingToLength: 10 withString: @"." startingAtIndex: 0];
    return str2;
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

#pragma mark stringByReplacingPercentEscapesUsingEncoding:
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
    NSLog(@"test001 %@",    [self method001]);
    NSLog(@"test002 %@",    [self method002]);
    NSLog(@"test003 %@",    [self method003]);
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
    NSLog(@"test014 %@",    [self method014]);
    
    NSLog(@"test015 %@",    [self method015]);
    //[self method016];//initWithBytes:length:encoding:
    //[self method017];//initWithBytes:length:encoding:
    
    NSLog(@"test018 %@",    [self method018]);
    NSLog(@"test019 %@",    [self method019]);
    
    NSLog(@"test020 %@",    [self method020]);
    
    NSLog(@"test021 %@",    [self method021]);
    NSLog(@"test022 %@",    [self method022]);
    NSLog(@"test023 %@",    [self method023]);  
    
    NSLog(@"test024 %@",    [self method024]); 
    NSLog(@"test025 %@",    [self method025]); 
    NSLog(@"test026 %@",    [self method026]); 
    NSLog(@"test027 %@",    [self method027]); 
    NSLog(@"test028 %@",    [self method028]); 
    
    
    //[self method029];//
    //[self method030];//
    //[self method031];//
    //[self method032];//
    //[self method033];//
    //[self method034];//
    //[self method035];//
    //[self method036];//
    
    NSLog([self method037]?@"method037 OK":@"method037 NG");//
    NSLog([self method038]?@"method038 OK":@"method038 NG");//
    
    NSLog(@"test039 %lu",    [self method039]); 
    NSLog(@"test040 %lu",    [self method040]);
    NSLog(@"test041 %lu",    [self method041]);
    [self method042];
    
    NSLog(@"test043 %@",    [self method043]);
    NSLog(@"test044 %@",    [self method044]);
    NSLog(@"test045 %@",    [self method045]);
    NSLog(@"test046 %@",    [self method046]);
    NSLog(@"test047 %@",    [self method047]);
    NSLog(@"test048 %@",    [self method048]);
    
}

@end
