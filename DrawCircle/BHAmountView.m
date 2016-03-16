//
//  BHAmountView.m
//  DrawCircle
//
//  Created by 王帅广 on 16/3/16.
//  Copyright © 2016年 Yeming. All rights reserved.
//

#import "BHAmountView.h"

@interface BHAmountView ()

@property (nonatomic,strong) UIView *amountLineView;

@property (nonatomic,strong) UIButton *amountButton;

@property (nonatomic,strong) UILabel *amountLabel;
@end

@implementation BHAmountView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.amountLineView];
        [self addSubview:self.amountLabel];
        [self addSubview:self.amountButton];
        
        [self intiUIOfView];
    }
    
    return self;
}

- (void)updateUserData
{
    [self.amountLineView removeFromSuperview];
    
    [self addSubview:self.amountLineView];
    [self addSubview:self.amountLabel];
    [self addSubview:self.amountButton];
    
    [self intiUIOfView];
}

-(void)intiUIOfView
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2,self.frame.size.height/2) radius:100 startAngle:0.7*M_PI endAngle:0.30 * M_PI  clockwise:YES];
    CAShapeLayer *arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.strokeColor = [UIColor redColor].CGColor;
    arcLayer.lineWidth=3;
    arcLayer.fillColor = [UIColor whiteColor].CGColor;
    arcLayer.frame=self.amountLineView.frame;
    [self.amountLineView.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer];
    
}
-(void)drawLineAnimation:(CALayer*)layer
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=0.8;
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
}




- (UIView *)amountLineView
{
    if (_amountLineView == nil) {
        
        _amountLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _amountLineView.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _amountLineView;
}

- (UIButton *)amountButton
{
    if (_amountButton == nil) {
        
        _amountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _amountButton.frame = CGRectMake(self.frame.size.width / 2 - 50, self.frame.size.width / 2 + 55, 100, 50);
        [_amountButton addTarget:self action:@selector(didClickAmountButton) forControlEvents:UIControlEventTouchUpInside];
        [_amountButton setTitle:@"点击" forState:UIControlStateNormal];
        [_amountButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _amountButton.backgroundColor = [UIColor greenColor];
    }
    return _amountButton;
}

- (void)didClickAmountButton
{
    
}

- (UILabel *)amountLabel
{
    if (_amountLabel == nil) {
        
        _amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 70, self.frame.size.height / 2 - 40, 140, 80)];
        _amountLabel.font = [UIFont systemFontOfSize:24];
        _amountLabel.textAlignment = NSTextAlignmentCenter;
        _amountLabel.textColor = [UIColor blackColor];
        _amountLabel.numberOfLines = 0;
        _amountLabel.text = @"240.0万元";
        
    }
    return _amountLabel;
}



@end
