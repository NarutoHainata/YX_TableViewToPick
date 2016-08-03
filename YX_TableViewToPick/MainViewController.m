//
//  MainViewController.m
//  YX_TableViewToPick
//
//  Created by yang on 16/8/3.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainViewController.h"
#import "PickerView.h"
@interface MainViewController ()<PickViewDelegate>//,PickViewDataSource>
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
//- (NSInteger)numberOfRowsInSelector:(PickerView *)valueSelector{
//    return 10;
//}
//- (CGFloat)rowHeightInSelector:(PickerView *)valueSelector{
//    return 30;
//}
- (void)selector:(UITableView *)valueSelector didSelectRowAtIndex:(NSInteger)index{
    NSLog(@"Selected index %ld",(long)index);
//    UITableViewCell *cell = [valueSelector cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index+3 inSection:0]];
//    cell.backgroundColor = [UIColor greenColor];
    
}
//- (CGFloat)rowWidthInSelector:(PickerView *)valueSelector{
//    return 50;
//}
//- (CGRect)rectForSelectionInSelector:(PickerView *)valueSelector{
//    return CGRectMake(0, 0, 10, 10);
//}
//- (UIView *)selector:(PickerView *)valueSelector viewForRowAtIndex:(NSInteger)index{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
//    return view;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.pickView];
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
