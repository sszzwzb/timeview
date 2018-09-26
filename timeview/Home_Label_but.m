//
//  Home_Label_but.m
//  BAOFUTONGBELOWLINE
//
//  Created by kaiyi on 16/7/8.
//  Copyright © 2016年 kaiyi. All rights reserved.
//

#import "Home_Label_but.h"

@implementation Home_Label_but


-(UILabel *)myName{
    if (_myName == nil) {
        _myName = [[UILabel alloc]initWithFrame:
                   CGRectMake(
                              0, 0, 40, CGRectGetHeight(self.frame))];
        _myName.textColor = [UIColor blackColor];
        _myName.font = [UIFont systemFontOfSize:15.f];
        _myName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_myName];
        
        
        _mybut = [[UIButton alloc]initWithFrame:
                   CGRectMake(CGRectGetMaxX(_myName.frame),
                              0,
                              CGRectGetWidth(self.frame) - CGRectGetWidth(_myName.frame),
                              CGRectGetHeight(self.frame))];
        _mybut.layer.masksToBounds = YES;
        _mybut.layer.cornerRadius = 2;
        _mybut.layer.borderWidth = 0.5;  //  边框
        _mybut.layer.borderColor = [UIColor grayColor].CGColor;
        _mybut.backgroundColor = [UIColor clearColor];
        [_mybut setTintColor: [UIColor grayColor]];
        [_mybut setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        _mybut.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [self addSubview:_mybut];
        _mybut.userInteractionEnabled = YES;
        
    }
    return _myName;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
