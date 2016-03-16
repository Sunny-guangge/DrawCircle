//
//  BHAmountView.h
//  DrawCircle
//
//  Created by 王帅广 on 16/3/16.
//  Copyright © 2016年 Yeming. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHAmountViewDelegate <NSObject>

- (void)didClickAmountButton;

@end

@interface BHAmountView : UIView

- (void)updateUserData;

@property (nonatomic,assign) id<BHAmountViewDelegate> delegate;

@property (nonatomic,assign) CGFloat value;

@end
