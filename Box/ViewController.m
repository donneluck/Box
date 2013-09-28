//
//  ViewController.m
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "OneViewController.h"
#import "Box.h"
#import "BoxContentViewController.h"

#define BOX_SIZE (CGSize){90,128}

#define NUMBER_BOXES_IPHONE5 9
#define NUMBER_BOXES_IPHONE4 6

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //fetch origin data
    NSString *path=[[NSBundle mainBundle]pathForResource:@"SampleData" ofType:@"plist"];
    NSDictionary *data=[[NSDictionary alloc]initWithContentsOfFile:path];
    
    //convert origin data
    self.data=[[NSMutableArray alloc]init];

    NSMutableArray *boxData;
    for (NSString *key in [data allKeys]) {
        boxData=[[NSMutableArray alloc]init];
        NSArray *array=[data objectForKey:key];
        for (NSDictionary *dict in array) {
            [boxData addObject:dict];
        }
        [self.data addObject:boxData];
    }
    NSLog(@"self.data:%d",[self.data count]);
    
    
    //initial all the boxes
    NSMutableArray *boxesArray=[[NSMutableArray alloc]initWithCapacity:self.data.count];
    for (NSArray *boxArray in self.data) {
        Box *box=[Box boxWithSize:BOX_SIZE];
        box.title=[[boxArray objectAtIndex:0]objectForKey:@"category"];
        box.secondTitle=[NSString stringWithFormat:@"%d",boxArray.count];
        box.onTap=^{
          //tap to push table view
            UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            BoxContentViewController *viewController=(BoxContentViewController*)[storyboard instantiateViewControllerWithIdentifier:@"BoxContentView"];
            viewController.boxContent=boxArray;
            [self.navigationController pushViewController:viewController animated:YES];
        };
        [box setup];
        [boxesArray addObject:box];
    }
    self.boxesArray=[[NSMutableArray alloc]initWithArray:boxesArray];
    NSLog(@"self.boxesarray count:%d",self.boxesArray.count);
    
    //calculating pages nubmer
    self.numberPages=(NSInteger)(self.data.count%[self numberOfBoxesInOneView]==0?self.data.count/[self numberOfBoxesInOneView]:self.data.count/[self numberOfBoxesInOneView]+1);

    
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < self.numberPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.controllers = controllers;
    
    self.scroller.pagingEnabled = YES;
    self.scroller.contentSize =
    CGSizeMake(CGRectGetWidth(self.scroller.frame) * self.numberPages, CGRectGetHeight(self.scroller.frame));
    self.scroller.showsHorizontalScrollIndicator = NO;
    self.scroller.showsVerticalScrollIndicator = NO;
    self.scroller.scrollsToTop = NO;
    self.scroller.delegate = self;
    
    if ([AppDelegate isRunningOniPhone5]) {
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(141, 511, 39, 37)];
    }else{
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(141, 423, 39, 37)];
    }
    
    self.pageControl.numberOfPages = self.numberPages;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0.118 green:0.392 blue:0.941 alpha:1.000];
    self.pageControl.pageIndicatorTintColor=[UIColor colorWithRed:0.098 green:0.824 blue:0.980 alpha:1.000];
    [self.view addSubview:self.pageControl];
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

//calculating number of boxes in one view, depend on is iphone5 or not
-(NSInteger)numberOfBoxesInOneView{
    if ([AppDelegate isRunningOniPhone5]==YES) {
        return NUMBER_BOXES_IPHONE5;
    }else{
        return NUMBER_BOXES_IPHONE4;
    }
}

- (void)loadScrollViewWithPage:(NSUInteger)page
{
    if (page >= self.numberPages)
        return;
    
    OneViewController *viewController = [self.controllers objectAtIndex:page];
    if ((NSNull *)viewController == [NSNull null])
    {
        NSInteger number=[self numberOfBoxesInOneView];
//        NSInteger rangeLength=number*(page+1)>=self.boxesArray.count?self.boxesArray.count%number:number;
        NSArray *boxesArray=[self.boxesArray subarrayWithRange:NSMakeRange(number*page, number*(page+1)>self.boxesArray.count?self.boxesArray.count%number:number)];
        viewController = [[OneViewController alloc] initWithBoxesArray:boxesArray];
        [self.controllers replaceObjectAtIndex:page withObject:viewController];
    }
    
    if (viewController.view.superview == nil)
    {
        CGRect frame = self.scroller.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        viewController.view.frame = frame;
        
        [self addChildViewController:viewController];
        [self.scroller addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = CGRectGetWidth(self.scroller.frame);
    NSUInteger page = floor((self.scroller.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
