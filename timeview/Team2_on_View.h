//
//  Team2_on_View.h
//  BAOFUTONGBELOWLINE
//
//  Created by kaiyi on 16/8/3.
//  Copyright © 2016年 kaiyi. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Home_Label_but;

/**
 *  团队  tabelView 上面的固定内容   Head View  内容
 *
 */

@interface Team2_on_View : UIView


//  开始时间
@property(nonatomic,strong) Home_Label_but *mybut1;

//   结束时间
@property(nonatomic,strong) Home_Label_but *mybut2;


@property(nonatomic,strong) Home_Label_but *mybut_team;  //  团队


@end
