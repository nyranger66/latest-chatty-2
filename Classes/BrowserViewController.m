//
//  BrowserViewController.m
//  LatestChatty2
//
//  Created by Alex Wayne on 3/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BrowserViewController.h"


@implementation BrowserViewController

- (id)initWithRequest:(NSURLRequest *)request {
  if (self = [super initWithNibName:@"BrowserViewController" bundle:nil]) {
    initialRequest = (NSMutableURLRequest *)[request retain];
    
    self.title = @"Browser";
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIBarButtonItem *safariButton = [[UIBarButtonItem alloc] initWithTitle:@"Safari"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(openInSafari)];
  self.navigationItem.rightBarButtonItem = safariButton;
  [safariButton release];
  
  [webView loadRequest:initialRequest];
}

- (IBAction)dragonDrop {
	[initialRequest setValue:@"" forHTTPHeaderField:@"Referer"];
	[webView loadRequest:initialRequest];
}

- (IBAction)openInSafari {
  [[UIApplication sharedApplication] openURL:[webView.request URL]];
}


- (void)dealloc {
  [initialRequest release];
  [super dealloc];
}


@end
