//
//  CMImageSlideViewController.h
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMImageSlideViewController : UIViewController
@property(nonatomic, readonly) UIScrollView * scrollview;
@property(nonatomic, copy)NSInteger (^totalePagesCount)(void);
@end
