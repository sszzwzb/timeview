//
//  ViewController.m
//  timeview
//
//  Created by kaiyi on 16/8/12.
//  Copyright © 2016年 kaiyi. All rights reserved.
//

#import "ViewController.h"
#import "Home_Label_but.h"
#import "Team2_on_View.h"


#define App_height self.view.frame.size.height
#define App_width self.view.frame.size.width

#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define color_gray_quxiao                   rgb(201,201,201)
#define color_gray_beijing_my               [UIColor whiteColor]




@interface ViewController ()

@property(nonatomic,strong) Team2_on_View *myView;


@property(nonatomic,strong) UIButton *pickerView_bg_gray;  //   整体的颜色背景  （颜色透明）

@property(nonatomic,strong) UIView *pickerView_bg;  //    UIPickerView

@property(nonatomic,strong) UIDatePicker *pickerView;  //  pickerView  复选框

#pragma mark  - - -     时间选择框
@property(nonatomic,assign) BOOL timeTag;  //    0：为在开始时间    1：为结束时间

@property(nonatomic,strong) NSString *dateString_beign;  //   选中的时间  开始时间
@property(nonatomic,strong) NSDate *dateString_beign_data;  //   选中的时间  开始时间
@property(nonatomic,strong) NSString *dateString_end;  //   选中的时间  截止时间
@property(nonatomic,strong) NSDate *dateString_end_data;  //   选中的时间  截止时间


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    

    
    _dateString_beign = [NSString string];
    _dateString_beign_data = [NSDate date];
    _dateString_end = [NSString string];
    _dateString_end_data = [NSDate date];

    [self up_view_on];
    
    //    UIPickerView
    [self up_UIDatePicker];
    
    //   第一次进来时刷的数据  开始的时间
    [self up_view_data_one];
    
}


///    上面的时间   界面
-(void)up_view_on{
    _myView = [[Team2_on_View alloc]initWithFrame:
               CGRectMake(
                          0,
                          170,
                          App_width,
                          52)];
    
    [self.view addSubview:_myView];
    
    _myView.mybut1.mybut.tag = 208;
    [_myView.mybut1.mybut addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    _myView.mybut2.mybut.tag = 209;
    [_myView.mybut2.mybut addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark  - - -- -     时间   处理
//   第一次进来时刷的数据
-(void)up_view_data_one{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //输出格式为：2010-10-27
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr2 = [dateFormatter2 stringFromDate:[NSDate date]];
    NSString *temp = [NSString stringWithFormat:@"%@-01",currentDateStr2];
    
    [_myView.mybut1.mybut setTitle:temp forState:(UIControlStateNormal)];
    [_myView.mybut2.mybut setTitle:currentDateStr forState:(UIControlStateNormal)];
    
    _dateString_beign = temp;
    _dateString_end = currentDateStr;
    NSLog(@"刚进来时执行的 开始时间：%@  ，  结束时间 : %@",_dateString_beign,_dateString_end);
    
    
    NSDateFormatter *dateFormatter3 = [[NSDateFormatter alloc] init];
    [dateFormatter3 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter3 dateFromString:[NSString stringWithFormat:@"%@ 10:12:12",temp]];
    _dateString_beign_data = date;
    
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    
    _dateString_end_data = mydate;
    
}



#pragma mark - -  - - -                      UIPickerView    --------------
-(void)up_UIDatePicker{
    _pickerView_bg_gray = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _pickerView_bg_gray.frame = CGRectMake(0, -64, App_width, App_height + 64);
    _pickerView_bg_gray.backgroundColor = [UIColor clearColor];  //  去掉颜色
    _pickerView_bg_gray.tag = 102;  //  取消
    [_pickerView_bg_gray addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    _pickerView_bg_gray.hidden = YES;
    [self.view addSubview:_pickerView_bg_gray];
    
    //   选择框的整体的背景图片
    _pickerView_bg = [[UIView alloc]initWithFrame:CGRectMake(0, App_height, CGRectGetWidth(self.view.frame) , 30 + 170)];
    _pickerView_bg.backgroundColor = color_gray_beijing_my;
    [self.view addSubview:_pickerView_bg];
    
    //  30 的距离写 按键
    UIView *butView = [[UIView alloc]initWithFrame:
                       CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
    butView.backgroundColor = color_gray_beijing_my;
    [_pickerView_bg addSubview:butView];
    //    右边确认
    UIButton *but = [UIButton buttonWithType:(UIButtonTypeSystem)];
    but.frame = CGRectMake(CGRectGetWidth(butView.frame) - 90, 3, 80, CGRectGetHeight(butView.frame));
    [but setTitle:@"确认" forState:(UIControlStateNormal)];
    [but setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    but.backgroundColor = [UIColor orangeColor];
    but.tag = 103;
    [but addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    but.layer.masksToBounds = YES;
    but.layer.cornerRadius = 3;
    [butView addSubview:but];
    
    
    //    左边取消
    UIButton *but2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    but2.frame = CGRectMake(10, 3, 80, CGRectGetHeight(butView.frame));
    [but2 setTitle:@"取消" forState:(UIControlStateNormal)];
    but2.backgroundColor = color_gray_quxiao;
    [but2 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    but2.tag = 102;
    [but2 addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    but2.layer.masksToBounds = YES;
    but2.layer.cornerRadius = 3;
    [butView addSubview:but2];
    
    
    
    // 选择框
    _pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 170)];  //   高度 170
    
    _pickerView.backgroundColor = [UIColor clearColor];
    //中文
    _pickerView.locale =[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    
    //显示年月日
    [_pickerView setDatePickerMode:UIDatePickerModeDate];
    
    
    [_pickerView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];//重点：UIControlEventValueChanged
    
    
    //设置显示格式
    //默认根据手机本地设置显示为中文还是其他语言
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    _pickerView.locale = locale;
    
    //显示年月日
    [_pickerView setDatePickerMode:UIDatePickerModeDate];
    
    
    [self.pickerView_bg addSubview:_pickerView];
    
    
#pragma mark -    获取当前时间到之 前 多久的时间
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    
    [adcomps setYear:-20];   ///    间隔20年
    [adcomps setMonth:-12];
    [adcomps setDay:-31];
    
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    NSLog(@"---前两个月 =%@",beforDate);
    
    
    if (_timeTag == 0) {  //    开始时间
        
        NSLog(@"刚进来时执行的 截止时间 date：%@  ",_dateString_end_data);
        
        //设置属性
        _pickerView.minimumDate = newdate;
        _pickerView.maximumDate = _dateString_end_data;  //   截止的最大时间
        
    }
    
    
#pragma mark -    获取当前时间到之 后 多久的时间
    if (_timeTag == 1) {  //    开始时间
        
        NSLog(@"刚进来时执行的 开始时间 date：%@  ",_dateString_beign_data);
        
        //设置属性
        _pickerView.minimumDate = _dateString_beign_data;   //   选中的开始时间;   //   当前时间
        _pickerView.maximumDate = mydate;   //   当前时间
    }
}

-(void)dateChanged:(id)sender{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    //添加你自己响应代码
    NSLog(@"dateChanged响应事件：%@",date);
    
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [_pickerView date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    //打印显示日期时间
    NSLog(@"格式化显示时间：%@",dateString);
    
    if (_timeTag == 0) {  //    开始时间
        _dateString_beign = dateString;
        _dateString_beign_data = pickerDate;
        
    }
    
    
    if (_timeTag == 1) {  //    结束时间
        _dateString_end= dateString;
        _dateString_end_data = pickerDate;
        
        NSLog(@"截止时间，复制date %@",_dateString_end_data);
        
    }
    ///      进行的判断
    [self class_time];
}

///      进行的判断
-(void)class_time{
    
#pragma mark -    获取当前时间到之 前 多久的时间
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    
    [adcomps setYear:-20];   ///    间隔20年
    [adcomps setMonth:-12];
    [adcomps setDay:-31];
    
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    NSLog(@"---前两个月 =%@",beforDate);
    
    
    if (_timeTag == 0) {  //    开始时间
        
        //设置属性
        _pickerView.minimumDate = newdate;
        _pickerView.maximumDate = _dateString_end_data;  //   截止的最大时间
        
    }
    
    
#pragma mark -    获取当前时间到之 后 多久的时间
    if (_timeTag == 1) {  //    开始时间
        
        NSLog(@"刚进来时执行的 开始时间 date：%@  ",_dateString_beign_data);
        
        //设置属性
        _pickerView.minimumDate = _dateString_beign_data;   //   选中的开始时间;   //   当前时间
        _pickerView.maximumDate = mydate;   //   当前时间
        
        
    }
}




-(void)buttonAction:(UIButton *)button{
    
    if (button.tag == 208) {
        NSLog(@"时间起始");
        
        
        
        _timeTag = 0;  //   判断我点击的是  开始时间
        
        //    pickerView  效果，弹出来
        [self pickerView:_pickerView];
        
        //   整体的背景颜色
        _pickerView_bg_gray.hidden = NO;
        
    }
    if (button.tag == 209) {
        NSLog(@"至 时间结束");
        
        
        
        
        _timeTag = 1;  //   判断我点击的是  结束时间
        
        //    pickerView  效果，弹出来
        [self pickerView:_pickerView];
        
        //   整体的背景颜色
        _pickerView_bg_gray.hidden = NO;
        
        
    }
    
    if (button.tag == 102) {
        //   效果，隐藏    （取消，按键）
        [UIView animateWithDuration:0.3 animations:^{
            
            self.pickerView_bg.transform=CGAffineTransformMakeTranslation(0, 0);  //  回到最开始的位置
            
            
        }];
        
        //   整体的背景颜色
        _pickerView_bg_gray.hidden = YES;
    }
    if (button.tag == 103) {
        
        
        //   效果，隐藏   （确认，按键）
        [UIView animateWithDuration:0.3 animations:^{
            
            self.pickerView_bg.transform=CGAffineTransformMakeTranslation(0, 0);  //  回到最开始的位置
            
            if (_timeTag == 0) {  //    开始时间
                
                [_myView.mybut1.mybut setTitle:_dateString_beign forState:(UIControlStateNormal)];
            }
            
            
            if (_timeTag == 1) {  //    结束时间
                
                [_myView.mybut2.mybut setTitle:_dateString_end forState:(UIControlStateNormal)];
            }
            
        }];
        
        //   整体的背景颜色
        _pickerView_bg_gray.hidden = YES;
    }
}
//    pickerView  效果，弹出来
-(void)pickerView:(UIDatePicker *)picker{
    //   效果，弹出来
    [UIView animateWithDuration:0.3 animations:^{
        
        self.pickerView_bg.transform=CGAffineTransformMakeTranslation(0, -200 - 49);  //  200 为移动的大小
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
