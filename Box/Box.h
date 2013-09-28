//
//  Box.h
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Box : UIView<UIGestureRecognizerDelegate>

//initialize
+(id)boxWithSize:(CGSize)size;

//call -setup: after property has value
-(void)setup;

//tap block
@property(nonatomic,strong)UITapGestureRecognizer *tapper;
@property(nonatomic,copy)Block onTap;

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *secondTitle;

@end
