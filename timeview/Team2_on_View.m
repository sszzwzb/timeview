//
//  Team2_on_View.m
//  BAOFUTONGBELOWLINE
//
//  Created by kaiyi on 16/8/3.
//  Copyright © 2016年 kaiyi. All rights reserved.
//

#import "Team2_on_View.h"
#import "Home_Label_but.h"

@implementation Team2_on_View


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self up_view];
    }
    return self;
}

-(void)up_view{
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    ////          下面的view
    UIView *view2 = [[UIView alloc]initWithFrame:
                     CGRectMake(
                                10,
                                10,
                                CGRectGetWidth(self.frame) - 20,
                                CGRectGetHeight(self.frame) - 10)];
    view2.backgroundColor = [UIColor whiteColor];
    [self addSubview:view2];
    view2.layer.borderWidth = 0.5;  //  边框
    view2.layer.borderColor = [UIColor grayColor].CGColor;  //  边框颜色
    
    //   时间按键
    _mybut1 = [[Home_Label_but alloc]initWithFrame:
               CGRectMake(
                          10,
                          (CGRectGetHeight(view2.frame) - 23 ) / 2,
                          CGRectGetWidth(view2.frame) / 2 - 20,
                          23)];
    
    _mybut1.myName.text = @"时间";
    _mybut1.userInteractionEnabled = YES;
    [_mybut1.mybut setTitle:@"请选择" forState:(UIControlStateNormal)];
    [view2 addSubview:_mybut1];
    
    //   至
    _mybut2 = [[Home_Label_but alloc]initWithFrame:
               CGRectMake(CGRectGetWidth(view2.frame) / 2,
                          (CGRectGetHeight(view2.frame) - 23 ) / 2,
                          CGRectGetWidth(view2.frame) / 2 - 20,
                          23)];
    
    _mybut2.myName.text = @"至";
    _mybut2.userInteractionEnabled = YES;
    [_mybut2.mybut setTitle:@"请选择" forState:(UIControlStateNormal)];
    [view2 addSubview:_mybut2];
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:
                      CGRectMake(
                                 10,
                                 150,
                                 CGRectGetWidth(self.frame) - 20,
                                 300)];
    [self addSubview:label];
    label.text = @"刚刚进入的时候开始时间为本月的第一天，结束时间为这个月的最后一天。\n判断条件，结束时间不会在开始时间之前，开始时间不会出现在结束时间之后。\n\n"
    "其他枚举 block 封装 \n"
    "//   单个的封装  \n"
    "//  0 显示默认初始化时间     开始时间到截止日期（截止日期不能超过今天）。\n"
    "//  1 不显示默认初始化时间   开始时间到截止日期（开始时间不能超过今天）。";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:14.f];
    label.textColor = [UIColor darkGrayColor];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
