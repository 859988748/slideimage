//
//  CMImageSlideSubtitleView.m
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import "CMImageSlideSubtitleView.h"
#import "contain.h"
#define CM_SubtitleLabelframe CGRectMake(10.0f, 5.0f, CM_ScreenFrame.size.width- 30.0f, 30.0f)
#define CM_CountLabelframe CGRectMake(CM_ScreenFrame.size.width- 60.0f, 5.0f, 30.0f, 30.0f)

@interface CMImageSlideSubtitleView()
@property(nonatomic,strong)UILabel * subtitleLabel;
@property(nonatomic,strong)UILabel * countleLabel;
@end

@implementation CMImageSlideSubtitleView
-(id)init{
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y = frame.size.height - 40.0f;
    self = [self initWithFrame: frame];
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:0.5f];
        _subtitleLabel = [[UILabel alloc] initWithFrame:CM_SubtitleLabelframe];
        _subtitleLabel.backgroundColor = [UIColor clearColor];
        _subtitleLabel.textAlignment = UITextAlignmentLeft;
        _subtitleLabel.font = [UIFont systemFontOfSize:13.0];
        _subtitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_subtitleLabel];
        
        _countleLabel = [[UILabel alloc] initWithFrame:CM_CountLabelframe];
        _countleLabel.backgroundColor = [UIColor clearColor];
        _countleLabel.textAlignment = UITextAlignmentLeft;
        _countleLabel.font = [UIFont fontWithName:@"Helvetica roman" size:14.0f];
        _countleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_countleLabel];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame GetSubtitleBlock:(NSString *(^)(void))subtitle GetTotalCountBlock:(NSUInteger (^)(void))TotalCount GetCurrentIndexBlock:(NSUInteger (^)(void))CurrentIndex{
    self = [self initWithFrame:frame];
    if (self) {
        _getSubtitle = subtitle;
        _subtitleLabel.text = _getSubtitle();

        _getTotalCount = TotalCount;
        
        _getCurrentIndex = CurrentIndex;
        _countleLabel.text = [NSString stringWithFormat:@"%d/%d",(int)_getCurrentIndex()+ 1,(int)_getTotalCount()];//currentIndex从0开始,+1从1开始
    }
    return self;
}


-(void)refreshView{
    if (_getSubtitle != nil && _getTotalCount != nil && _getCurrentIndex != nil) {
        _subtitleLabel.text = _getSubtitle();
        _countleLabel.text = [NSString stringWithFormat:@"%d/%d",(int)_getCurrentIndex()+ 1,(int)_getTotalCount()];//currentIndex从0开始,+1从1开始
    }else{
        NSLog(@"block is nil, please check corresponding block");
    }
}

@end
