//
//  OneContentViewController.h
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property(nonatomic,strong)NSDictionary *content;

@end
