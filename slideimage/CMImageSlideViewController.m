//
//  CMImageSlideViewController.m
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import "CMImageSlideViewController.h"
#import "CMImageSlideSubtitleView.h"

@interface CMImageSlideViewController ()
{
    CMImageSlideSubtitleView * imageslde;
    NSString * str;
    NSArray * array;
}
@end

@implementation CMImageSlideViewController
-(void)loadView{
    str = @"酒店";
    array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    frame.origin.y += 60;
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor =[UIColor blueColor];
    self.view = view;
    
//    CMImageSlideSubtitleView * imageslde = [[CMImageSlideSubtitleView alloc] initWithFrame:CGRectMake(0, 0, CM_ScreenFrame.size.width, 40.0f) GetSubtitleBlock:^{return @"subtitle";} GetTotalCountBlock:^{return 5;}];
    imageslde = [[CMImageSlideSubtitleView alloc] initWithFrame:CGRectMake(0, 100, CM_ScreenFrame.size.width, 40.0f)];
    [view addSubview:imageslde];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak NSString * weakstr = str;
    __weak NSArray * weakarray  = array;
    imageslde.getSubtitle = ^{return weakstr;};
    imageslde.getTotalCount = ^{return weakarray.count;};
    imageslde.getCurrentIndex = ^{return weakarray.count;};
    [imageslde refreshView];
}
-(void)viewWillAppear:(BOOL)animated{
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    backBtn.backgroundColor = [UIColor blackColor];
//    [backBtn setImage:[UIImage imageNamed:@"backBtn.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:backBtn];
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
