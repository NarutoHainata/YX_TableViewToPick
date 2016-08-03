//
//  PickerView.h
//  YX_TableViewToPick
//
//  Created by yang on 16/8/3.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PickerView;
@protocol PickViewDelegate <NSObject>

- (void)selector:(UITableView *)valueSelector didSelectRowAtIndex:(NSInteger)index;

@end
//
@protocol PickViewDataSource <NSObject>
//让控制器返回供选择的row个数
- (NSInteger)numberOfRowsInSelector:(PickerView *)valueSelector;
//返回row的高度
- (CGFloat)rowHeightInSelector:(PickerView *)valueSelector;

@optional
- (UIView *)selector:(PickerView *)valueSelector viewForRowAtIndex:(NSInteger)index selected:(BOOL)selected;
@end

@interface PickerView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<PickViewDelegate>delegate;
@property (nonatomic, weak) id<PickViewDataSource>dataSource;
- (void)reloadData;

@end
