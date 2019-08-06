//
//  TQLoginVC.m
//  CodeFrame_OC
//
//  Created by 何太强 on 2019/8/6.
//  Copyright © 2019 何太强. All rights reserved.
//

#import "TQLoginVC.h"

@interface TQLoginVC ()

@end

@implementation TQLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
    
    [self loadViewFrame];
}

#pragma mark view Frame
- (void)loadViewFrame {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:UIColor.blueColor];
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@250);
        make.height.equalTo(@30);
        make.center.equalTo(self.view);
    }];
    
    
}

#pragma mark -- button action

- (void)loginBtnAction:(UIButton *)sender {
    
      [[NSNotificationCenter defaultCenter] postNotificationName:notifyLogin object:nil];
}

@end
