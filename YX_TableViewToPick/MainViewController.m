//
//  MainViewController.m
//  YX_TableViewToPick
//
//  Created by yang on 16/8/3.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainViewController.h"
#import "PickerView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<PickViewDelegate,PickViewDataSource>
@property (nonatomic, strong) PickerView *pickView;
@end

@implementation MainViewController
-(PickerView *)pickView{
    if (_pickView == nil) {
        _pickView = [[PickerView alloc]initWithFrame:CGRectMake(40, 100, self.view.frame.size.width-80, 225)];
        _pickView.delegate = self;
    }
    return _pickView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.pickView];
}
#pragma mark PickViewDelegate
- (void)selector:(UITableView *)valueSelector didSelectRowAtIndex:(NSInteger)index{
    NSLog(@"Selected index %ld",(long)index);
}
#pragma mark PickViewDataSource
- (NSInteger)numberOfRowsInSelector:(PickerView *)valueSelector{
    return 20;
}
- (CGFloat)rowHeightInSelector:(PickerView *)valueSelector{
    return 45;
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
