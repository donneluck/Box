//
//  Box.m
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import "Box.h"

@implementation Box

@synthesize onTap,tapper;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addGestureRecognizer:self.tapper];
    }
    return self;
}

+ (id)boxWithSize:(CGSize)size {
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    Box *box = [[self alloc] initWithFrame:frame];
    return box;
}

-(void)setup{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/3)];
    label.backgroundColor=[UIColor clearColor];
    label.text=self.title;
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:(38.0)];
    label.adjustsFontSizeToFitWidth=YES;
    [self addSubview:label];
    
    UILabel *secondLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*2/3, self.frame.size.width, self.frame.size.height/3)];
    secondLabel.backgroundColor=[UIColor clearColor];
    secondLabel.text=self.secondTitle;
    label.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:(18.0)];
    secondLabel.textAlignment=NSTextAlignmentRight;
    label.adjustsFontSizeToFitWidth=YES;
    secondLabel.textColor=[UIColor whiteColor];
    [self addSubview:secondLabel];
    
}


#pragma mark - gesture recognizer
- (UITapGestureRecognizer *)tapper {
    if (!tapper) {
        tapper = [[UITapGestureRecognizer alloc]
                  initWithTarget:self action:@selector(tapped)];
        tapper.delegate = self;
    }
    return tapper;
}

-(void)tapped{
    if (self.onTap) {
        self.onTap();
    }
}


#pragma mark - draw rect
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor* topColor = [UIColor colorWithRed:0.118 green:0.392 blue:0.941 alpha:1.000];
    UIColor* bottomColor = [UIColor colorWithRed:0.098 green:0.824 blue:0.980 alpha:1.000];
    
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)topColor.CGColor,
                               (id)bottomColor.CGColor, nil];
    CGFloat gradientLocations[] = {0,1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, rect.size.width, rect.size.height)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(rect.size.width / 2.0, 0), CGPointMake(rect.size.width / 2.0, rect.size.height), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
