//
//  ViewController.m
//  EventDemo
//

//  Copyright © 2019 hycrazyfish. All rights reserved.
//

#import "ViewController.h"
#import "testButton.h"
@interface ViewController (){
    testButton *testBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    testBtn = [[testButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

//点击按钮触发事件响应
- (void)doAction:(testButton *)sender {
    NSLog(@"click this button");
}


@end
