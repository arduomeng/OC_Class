//
//  ViewController.m
//  ProgressBar1
//
//  Created by arduomeng on 16/11/18.
//  Copyright © 2016年 arduomeng. All rights reserved.
//

#import "ViewController.h"
#import "ProgressBarView.h"
@interface ViewController ()
@property (nonatomic, strong) ProgressBarView *pbView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pbView = [[ProgressBarView alloc] initWithFrame:CGRectMake(20, 100, 300, 10)];
    [self.view addSubview:_pbView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static float count = 0;
    count += 0.1;
    _pbView.progress = count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
