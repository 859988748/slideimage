//
//  ViewController.m
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#import "ViewController.h"
#import "CMImageSlideViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnTaped:(id)sender {
    NSLog(@"bth taped");
    CMImageSlideViewController * controller = [[CMImageSlideViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.navigationBarHidden = NO;
    [self presentViewController:nav animated:YES completion:nil];
}

@end
