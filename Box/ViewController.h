//
//  ViewController.h
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

//converted data
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)NSArray *boxesArray;

//scroll view
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;

//view controllers
@property(nonatomic,strong)NSMutableArray *controllers;

//page control
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property(nonatomic)NSUInteger numberPages;
@end
