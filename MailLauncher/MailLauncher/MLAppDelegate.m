//
//  MLAppDelegate.m
//  MailLauncher
//
//  Created by besbes on 20.10.13.
//  
//

#import "MLAppDelegate.h"

@implementation MLAppDelegate
{
    NSStatusItem* _theItem;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _theItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _theItem.title = NSLocalizedString(@"M",@"");
    _theItem.highlightMode = YES;
    _theItem.target = self;
    _theItem.action = @selector(compose:);
}


-(void)compose:(id)sender {
    NSAppleScript *mailScript;
    NSString *scriptString = @"tell application \"Mail\"\nmake new outgoing message with properties {visible:true}\nactivate\nend tell";
    mailScript = [[NSAppleScript alloc] initWithSource:scriptString];
    [mailScript executeAndReturnError:nil];
}


@end
