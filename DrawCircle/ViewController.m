//
//  ViewController.m
//  DrawCircle
//
//  Created by Yeming on 13-8-27.
//  Copyright (c) 2013年 Yeming. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BHAmountView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self intiUIOfView];
    self.view.backgroundColor=[UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    
    BHAmountView *view = [[BHAmountView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width)];
    view.value = 8888.88;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
