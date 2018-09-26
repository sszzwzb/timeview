//
//  DIYSystemDatePickerView.h
//  timeview
//
//  Created by kaiyi on 2018/9/25.
//  Copyright © 2018年 kaiyi. All rights reserved.
//



#define KScreenWidth        [UIScreen mainScreen].bounds.size.width
#define KScreenHeight       [UIScreen mainScreen].bounds.size.height


#define iPhoneX ({BOOL is_iPhoneX = NO;if (@available(iOS 11.0, *)) {is_iPhoneX = ([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 ? YES :NO);}is_iPhoneX;})


// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define KScreenNavigationBarHeight (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define KScreenTabBarHeight (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define KScreenTabBarIndicatorHeight (iPhoneX ? 34.f : 0.f)


#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define color_gray_quxiao                   rgb(201,201,201)
#define color_gray_beijing_my               [UIColor whiteColor]




















#import <UIKit/UIKit.h>

@interface DIYSystemDatePickerView : UIView


typedef NS_ENUM(NSInteger, DIYSystemDatePickerENUM) {
    DIYSystemDatePickerENUM0 = 0,       //  0 显示默认初始化时间     开始时间到截止日期（截止日期不能超过今天）。
    DIYSystemDatePickerENUM1 = 1,       //  1 不显示默认初始化时间   开始时间到截止日期（开始时间不能超过今天）。 
    
    
    DIYSystemDatePickerENUMOnly,
};


-(void)showBeginTimePicker;
-(void)showEndTimePicker;

typedef void (^getSelectBeginTime) (NSString *beginTimeStr);
@property (nonatomic,strong) getSelectBeginTime getSelectBeginTime;

typedef void (^getSelectEndTime) (NSString *endTimeStr);
@property (nonatomic,strong) getSelectEndTime getSelectEndTime;




//  type 截止日期不能大于开始日期
- (instancetype)initWithType:(DIYSystemDatePickerENUM)type getSelectBeginTime:(getSelectBeginTime)getSelectBeginTime getSelectEndTime:(getSelectEndTime)getSelectEndTime;


//   年月日时间选择器
- (instancetype)initWithType:(DIYSystemDatePickerENUM)type getSelectBeginTime:(getSelectBeginTime)getSelectBeginTime;


@end
