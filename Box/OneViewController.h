//
//  OneViewController.h
//  Box
//
//  Created by donne on 9/24/13.
//  Copyright (c) 2013 Donne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneViewController : UIViewController<UIGestureRecognizerDelegate>

-(id)initWithBoxesArray:(NSArray*)array;

//@property(nonatomic,strong)Block onTap;
//@property(nonatomic,strong)UITapGestureRecognizer *tapper;

@end
