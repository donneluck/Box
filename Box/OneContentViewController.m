//
//  OneContentViewController.m
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import "OneContentViewController.h"

@interface OneContentViewController ()

@end

@implementation OneContentViewController
@synthesize content;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title=[content objectForKey:@"title"];
    self.titleLabel.text=[content objectForKey:@"title"];
    self.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.textView.text=[content objectForKey:@"content"];
    self.textView.editable=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
