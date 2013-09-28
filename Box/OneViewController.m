//
//  OneViewController.m
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import "OneViewController.h"
#import "Box.h"
#import "AppDelegate.h"

#define BOXES_TOP_MARGIN 80
#define BOXES_LEFT_MARGIN 10
#define BOXES_SPACING 10

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//custom initial method
-(id)initWithBoxesArray:(NSArray*)array{
    self=[super init];
    if (self) {
        self.view.backgroundColor=[UIColor clearColor];
        if (array.count>=3) {
            NSArray *subarray=[array subarrayWithRange:NSMakeRange(0, 3)];
            for (int i=0;i<subarray.count;i++) {
                Box *box=[array objectAtIndex:i];
                box.frame=CGRectMake(BOXES_LEFT_MARGIN+(BOXES_SPACING+box.frame.size.width)*i, BOXES_TOP_MARGIN+(box.frame.size.height+BOXES_SPACING)*0, box.frame.size.width, box.frame.size.height);
                [self.view addSubview:box];
            }
        }else{
            for (int i=0;i<array.count;i++) {
                Box *box=[array objectAtIndex:i];
                box.frame=CGRectMake(BOXES_LEFT_MARGIN+(BOXES_SPACING+box.frame.size.width)*i, BOXES_TOP_MARGIN, box.frame.size.width, box.frame.size.height);
                [self.view addSubview:box];
                
            }
            return self;
        }
       
        if (array.count>=6) {
            NSArray *subarray=[array subarrayWithRange:NSMakeRange(3, 3)];
            for (int i=0;i<subarray.count;i++) {
                Box *box=[subarray objectAtIndex:i];
                box.frame=CGRectMake(BOXES_LEFT_MARGIN+(BOXES_SPACING+box.frame.size.width)*i, BOXES_TOP_MARGIN+box.frame.size.height+BOXES_SPACING, box.frame.size.width, box.frame.size.height);
                [self.view addSubview:box];
            }
        }else{
            NSArray *subarray=[array subarrayWithRange:NSMakeRange(3, array.count-3)];
            for (int i=0;i<subarray.count;i++) {
                Box *box=[subarray objectAtIndex:i];
                box.frame=CGRectMake(BOXES_LEFT_MARGIN+(BOXES_SPACING+box.frame.size.width)*i, BOXES_TOP_MARGIN+box.frame.size.height+BOXES_SPACING, box.frame.size.width, box.frame.size.height);
                [self.view addSubview:box];
                
            }
            return self;
        }
        
        if (array.count>6) {
            NSArray *subarray=[array subarrayWithRange:NSMakeRange(6, array.count-6)];
            for (int i=0;i<subarray.count;i++) {
                Box *box=[subarray objectAtIndex:i];
                box.frame=CGRectMake(BOXES_LEFT_MARGIN+(BOXES_SPACING+box.frame.size.width)*i, BOXES_TOP_MARGIN+(box.frame.size.height+BOXES_SPACING)*2, box.frame.size.width, box.frame.size.height);
                [self.view addSubview:box];
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
