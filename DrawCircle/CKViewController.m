//
//  CKViewController.m
//  DrawCircle
//
//  Created by 王帅广 on 16/3/16.
//  Copyright © 2016年 Yeming. All rights reserved.
//

#import "CKViewController.h"

@interface CKViewController ()

@end

@implementation CKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawLine];
}

- ( void )drawLine{
    
    
    //view 是曲线的背景 view
    
    UIView *view = [[ UIView alloc ] initWithFrame : CGRectMake ( 10 , 0 , 300 , 300 )];
    
    view. backgroundColor = [ UIColor whiteColor ];
    
    [ self . view addSubview :view];
    
    // 第一、 UIBezierPath 绘制线段
    
    UIBezierPath *firstPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 0 , 0 , 5 , 5 )];
    
//    UIBezierPath *firstPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2) radius:100 startAngle:0 endAngle:240 clockwise:YES];
    
    CGPoint p1 = CGPointMake ( 0 , 0 );
    
    CGPoint p2 = CGPointMake ( 300 , 0 );
    
    [firstPath addLineToPoint :p1];
    
    [firstPath addLineToPoint :p2];
    
    UIBezierPath *lastPath = [ UIBezierPath bezierPathWithOvalInRect : CGRectMake ( 300 , 0 , 0 , 0 )];
    
    [firstPath appendPath :lastPath];
    
    
    
    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    
    CAShapeLayer *lineLayer2 = [ CAShapeLayer layer ];
    
    lineLayer2. frame = CGRectMake ( 0 , 50 , 320 , 40 );
    
    lineLayer2. fillColor = [ UIColor yellowColor ]. CGColor ;
    
    lineLayer2. path = firstPath. CGPath ;
    
    lineLayer2. strokeColor = [ UIColor redColor ]. CGColor ;
    
    //第三，动画
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    
    ani. fromValue = @0 ;
    
    ani. toValue = @1 ;
    
    ani. duration = 5 ;
    
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    
    [view.layer addSublayer :lineLayer2];
    
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
