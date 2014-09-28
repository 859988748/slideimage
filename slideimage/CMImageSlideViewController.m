//
//  CMImageSlideViewController.m
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import "CMImageSlideViewController.h"
#import "CMImageSlideSubtitleView.h"
#import "CMImageSlideView.h"
#import "contain.h"

@interface CMImageSlideViewController ()
{
    CMImageSlideSubtitleView * imageSlideSubtitleV;
    CMImageSlideView * imageSlideV;
    NSString * str;
    NSArray * strimageUrls;
    NSMutableArray * imageUrls;
}
@end

@implementation CMImageSlideViewController
-(void)loadView{
    str = @"酒店";
    imageUrls = [[NSMutableArray alloc] init];
    strimageUrls = [NSArray arrayWithObjects:@"http://p6.sinaimg.cn/1653728301/180/57111255515249",@"http://d3.sina.com.cn/pfpghc/f34b633a14b74279a3bcce8c6af644ab.jpg",@"http://f.hiphotos.baidu.com/image/w%3D1920%3Bcrop%3D0%2C0%2C1920%2C1080/sign=ad8a20c7eb24b899de3c7d315c3626f6/d000baa1cd11728bc2a286e5cafcc3cec2fd2c6d.jpg",@"http://d.hiphotos.baidu.com/image/w%3D1920%3Bcrop%3D0%2C0%2C1920%2C1080/sign=1c9474f8b78f8c54e3d3c12608191696/21a4462309f790522be7f5280ff3d7ca7bcbd528.jpg",@"http://image.tianjimedia.com/uploadImages/2014/241/27/00XB2QCF4NEK_680x500.jpg",@"http://g.hiphotos.baidu.com/image/h%3D1080%3Bcrop%3D0%2C0%2C1920%2C1080/sign=c7161ec36509c93d18f20af7a70dc3bf/5882b2b7d0a20cf43facaa1274094b36acaf993a.jpg",@"http://h.hiphotos.baidu.com/image/pic/item/cf1b9d16fdfaaf51bcc98bc38e5494eef01f7aa7.jpg",nil];
    for (NSString * strr in strimageUrls) {
        NSURL * url = [NSURL URLWithString:strr];
        [imageUrls addObject:url];
    }
    
    
    CGRect frame = CM_ScreenFrame;
    frame.size.height -= self.navigationController.navigationBar.frame.size.height;
    CGFloat sysVer = [UIDevice currentDevice].systemVersion.floatValue;
    if (sysVer > 6.99) {
        frame.size.height -= [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor =[UIColor clearColor];
    self.view = view;

    imageSlideV = [[CMImageSlideView alloc] initWithFrame:frame];
    imageSlideV.backgroundColor = [UIColor blackColor];
    imageSlideV.delegate = self;
    imageSlideV.ImageURLs = imageUrls;
    [self.view addSubview:imageSlideV];
    
    imageSlideSubtitleV = [[CMImageSlideSubtitleView alloc] initWithFrame:CGRectMake(0, frame.size.height - 40.0f, CM_ScreenFrame.size.width, 40.0f)];
    [self.view addSubview:imageSlideSubtitleV];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Do any additional setup after loading the view.
    __weak NSString * weakstr = str;
    __weak CMImageSlideView * weakImageSlideView = imageSlideV;
    imageSlideSubtitleV.getSubtitle = ^{return weakstr;};
    imageSlideSubtitleV.getTotalCount = ^{return weakImageSlideView.ImageURLs.count; };
    imageSlideSubtitleV.getCurrentIndex = ^{return (NSUInteger)weakImageSlideView.currentIndex;};
    [imageSlideSubtitleV refreshView];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.hidesBackButton = YES;
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    [backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:backBtn];
    [imageSlideV ShowView];
}

-(void)CMImageSlideViewDidSlide{
    [imageSlideSubtitleV refreshView];
}
-(void)back:(id) sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
