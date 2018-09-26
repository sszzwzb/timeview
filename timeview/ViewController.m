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

#import "DIYSystemDatePicker/DIYSystemDatePickerView.h"


#define App_height self.view.frame.size.height
#define App_width self.view.frame.size.width






@interface ViewController ()

@property(nonatomic,strong) Team2_on_View *myView;

@property(nonatomic,strong) DIYSystemDatePickerView *datePickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    

    [self up_view_on];
    
    
    
//      开始日期是过去的日子  截止日期不能大于今天
    _datePickerView = [[DIYSystemDatePickerView alloc]initWithType:DIYSystemDatePickerENUM0
                                                getSelectBeginTime:^(NSString *beginTimeStr) {
                                                    
                                                    [_myView.mybut1.mybut setTitle:beginTimeStr forState:(UIControlStateNormal)];
                                                    
                                                } getSelectEndTime:^(NSString *endTimeStr) {
                                                    
                                                    [_myView.mybut2.mybut setTitle:endTimeStr forState:(UIControlStateNormal)];
                                                    
                                                }];
    [self.view addSubview:_datePickerView];
    
    
    
    //  开始日期不能小于今天 ， 截止日期大于今天   初始不显示
//    _datePickerView = [[DIYSystemDatePickerView alloc]initWithType:DIYSystemDatePickerENUM1
//                                                getSelectBeginTime:^(NSString *beginTimeStr) {
//
//                                                    [_myView.mybut1.mybut setTitle:beginTimeStr forState:(UIControlStateNormal)];
//
//                                                } getSelectEndTime:^(NSString *endTimeStr) {
//
//                                                    [_myView.mybut2.mybut setTitle:endTimeStr forState:(UIControlStateNormal)];
//
//                                                }];
//    [self.view addSubview:_datePickerView];
    
    
    
    //   单个的封装   显示用    [_datePickerView showBeginTimePicker];   可以不用写全局的，每个都是独立的那种
//    _datePickerView = [[DIYSystemDatePickerView alloc]initWithType:DIYSystemDatePickerENUMOnly
//                                                getSelectBeginTime:^(NSString *beginTimeStr) {
//                                                    [_myView.mybut1.mybut setTitle:beginTimeStr forState:(UIControlStateNormal)];
//                                                }];
//    [self.view addSubview:_datePickerView];
    
    
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

-(void)buttonAction:(UIButton *)button{
    
    if (button.tag == 208) {
        NSLog(@"时间起始");
        
        [_datePickerView showBeginTimePicker];
        
        
    }
    if (button.tag == 209) {
        NSLog(@"至 时间结束");
        
        [_datePickerView showEndTimePicker];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
