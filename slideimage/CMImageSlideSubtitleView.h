//
//  CMImageSlideSubtitleView.h
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contain.h"

@interface CMImageSlideSubtitleView : UIView

@property(nonatomic, copy)NSString *(^getSubtitle)(void);
@property(nonatomic,copy)NSUInteger (^getTotalCount)(void);
@property(nonatomic,copy)NSUInteger (^getCurrentIndex)(void);

-(id)initWithFrame:(CGRect)frame;
-(id)initWithFrame:(CGRect)frame GetSubtitleBlock:(NSString *(^)(void))subtitle GetTotalCountBlock:(NSUInteger (^)(void))TotalCount GetCurrentIndexBlock:(NSUInteger (^)(void))CurrentIndex;
-(void)refreshView;
@end
