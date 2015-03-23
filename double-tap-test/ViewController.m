//  Created by Alexander Skorulis on 23/03/2015.
//  Copyright (c) 2015 com.skorulis. All rights reserved.

#import "ViewController.h"

static CGFloat const kButtonWidth = 100;

@interface ViewController () {
    UIButton* _buttonLeft;
    UIButton* _buttonRight;
    UILabel* _title;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _title = [[UILabel alloc] init];
    _title.text = [NSString stringWithFormat:@"%ld",(long)_index];
    _title.textAlignment = NSTextAlignmentCenter;
    
    _buttonLeft = [[UIButton alloc] init];
    [_buttonLeft setTitle:@"back" forState:UIControlStateNormal];
    [_buttonLeft addTarget:self action:@selector(backPressed:) forControlEvents:UIControlEventTouchUpInside];
    _buttonLeft.backgroundColor = [UIColor grayColor];
    
    _buttonRight = [[UIButton alloc] init];
    [_buttonRight setTitle:@"next" forState:UIControlStateNormal];
    [_buttonRight addTarget:self action:@selector(nextPressed:) forControlEvents:UIControlEventTouchUpInside];
    _buttonRight.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_title];
    [self.view addSubview:_buttonLeft];
    [self.view addSubview:_buttonRight];
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _title.frame = CGRectMake(0, 10, self.view.frame.size.width, 40);
    _buttonLeft.frame = CGRectMake(0, self.view.frame.size.height/2, kButtonWidth, 150);
    _buttonRight.frame = CGRectMake(self.view.frame.size.width-kButtonWidth, self.view.frame.size.height/2, kButtonWidth, 150);
}

#pragma mark actions

- (void) backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (void) nextPressed:(id)sender {
    ViewController* next = [[ViewController alloc] init];
    next.index = self.index + 1;
    [self.navigationController pushViewController:next animated:true];
}


@end
