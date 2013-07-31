/**
 * Copyright 2013 Sergey Nosenko 
 *
 * Thanks to http://stackoverflow.com/questions/10284433/ios5-tabbar-fonts-and-color
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "UaComIpublisherCustomizeTabGroupModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "ImageLoader.h"

@implementation UaComIpublisherCustomizeTabGroupModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"0563a80f-dd84-44ce-ac9e-d35719f808a0";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ua.com.ipublisher.customize.tab.group";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)customizeNormalTabText:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    TiColor *textColor      = [TiUtils colorValue:[args objectForKey:@"textColor"]];
    TiColor *shadowColor    = [TiUtils colorValue:[args objectForKey:@"shadowColor"]];
    WebFont *font           = [TiUtils fontValue:[args objectForKey:@"font"]];
    [[UITabBarItem appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:
            [textColor color], UITextAttributeTextColor,
            [shadowColor color], UITextAttributeTextShadowColor,
            [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
            [font font], UITextAttributeFont,
            nil
        ]
                                             forState:UIControlStateNormal];
}
-(void)customizeHighlightedTabText:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    TiColor *textColor      = [TiUtils colorValue:[args objectForKey:@"textColor"]];
    TiColor *shadowColor    = [TiUtils colorValue:[args objectForKey:@"shadowColor"]];
    WebFont *font           = [TiUtils fontValue:[args objectForKey:@"font"]];
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [textColor color], UITextAttributeTextColor,
      [shadowColor color], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
      [font font], UITextAttributeFont,
      nil
      ]
                                             forState:UIControlStateHighlighted];
}
-(void)customizeDisabledTabText:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    TiColor *textColor      = [TiUtils colorValue:[args objectForKey:@"textColor"]];
    TiColor *shadowColor    = [TiUtils colorValue:[args objectForKey:@"shadowColor"]];
    WebFont *font           = [TiUtils fontValue:[args objectForKey:@"font"]];
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [textColor color], UITextAttributeTextColor,
      [shadowColor color], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
      [font font], UITextAttributeFont,
      nil
      ]
                                             forState:UIControlStateDisabled];
}
-(void)customizeTabSelectedImage:(id)args
{
    ENSURE_SINGLE_ARG(args, NSString);
    [[UITabBar appearance] setSelectionIndicatorImage:[self loadImage:args]];
}
         
 -(UIImage*)loadImage:(id)image
{
    if (image==nil) return nil;
    NSURL *url = [TiUtils toURL:image proxy:self];
    if (url==nil)
    {
        NSLog(@"[WARN] could not find image: %@",image);
        return nil;
    }
    return [[ImageLoader sharedLoader] loadImmediateImage:url];
}
         

//[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"YourCustomSelectionIndicator.png"]];
@end
