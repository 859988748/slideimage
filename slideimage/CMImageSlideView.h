//
//  CMImageSlideView.h
//  MetroChina
//
//  Created by llch on 14-9-28.
//  Copyright (c) 2014年 TouchChina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CMImageSlideViewDelegate <NSObject>

@optional
-(void)CMImageSlideViewDidSlide;

@end

@interface CMImageSlideView : UIView <UIScrollViewDelegate>{
    NSInteger _currentIndex;
    __weak NSArray * _ImageURLs;
    NSMutableArray * _ImageViews;
}

@property(nonatomic, readonly)NSInteger currentIndex;
@property(nonatomic, strong)UIScrollView * scrollV;
@property(nonatomic, weak)NSArray * ImageURLs;
@property(nonatomic, weak)id<CMImageSlideViewDelegate> delegate;

-(void)ShowView;

@end
