//
//  CMImageSlideView.m
//  MetroChina
//
//  Created by llch on 14-9-28.
//  Copyright (c) 2014年 TouchChina. All rights reserved.
//

#import "CMImageSlideView.h"
//#import "UIImageView+AFNetworking.h"
//#import "UIImage+resizeMagick.h"
@implementation CMImageSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollV = [[UIScrollView alloc] initWithFrame:frame];
        _scrollV.pagingEnabled = YES;
        _scrollV.delegate = self;
        _currentIndex = 0;
        _ImageURLs = nil;
        _ImageViews = nil;
        [self addSubview:_scrollV];
    }
    return self;
}

-(void)ShowView{
    if (_ImageURLs != nil) {
        NSInteger TotalImageCount = _ImageURLs.count;
        _scrollV.contentSize = CGSizeMake(_scrollV.frame.size.width * TotalImageCount, _scrollV.frame.size.height);
        _ImageViews = [NSMutableArray arrayWithCapacity:TotalImageCount];
        for (int i = 0 ; i < TotalImageCount; i++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollV.frame.size.width * i, 0, _scrollV.frame.size.width, _scrollV.frame.size.height)];
            imageView.contentMode = UIViewContentModeCenter;
            [_ImageViews addObject:imageView];
            [_scrollV addSubview:imageView];
        }
        _currentIndex = _scrollV.contentOffset.x / _scrollV.frame.size.width;
        UIImageView * imageview = [_ImageViews objectAtIndex:_currentIndex];
        __weak UIImageView * weakImageView = imageview;
        __weak UIScrollView * weakScrollV = _scrollV;
//        [imageview setImageWithURLRequest:[NSURLRequest requestWithURL:[_ImageURLs objectAtIndex:_currentIndex]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//            UIImage * resizedImage = [image resizedImageWithMaximumSize:weakScrollV.frame.size];
//            [weakImageView setImage:resizedImage];
//        } failure:nil];
        
    }else{
        NSLog(@"ImageURLs is nil");
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    _currentIndex = _scrollV.contentOffset.x / _scrollV.frame.size.width;
    UIImageView * imageview = [_ImageViews objectAtIndex:_currentIndex];
    __weak UIImageView * weakImageView = imageview;
    __weak UIScrollView * weakScrollV = _scrollV;
//    [imageview setImageWithURLRequest:[NSURLRequest requestWithURL:[_ImageURLs objectAtIndex:_currentIndex]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        UIImage * resizedImage = [image resizedImageWithMaximumSize:weakScrollV.frame.size];
//        [weakImageView setImage:resizedImage];
//    } failure:nil];
    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(CMImageSlideViewDidSlide)]) {
            [_delegate CMImageSlideViewDidSlide];
        }
    }
}
@end
