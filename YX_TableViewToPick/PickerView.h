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
//@protocol PickViewDataSource <NSObject>
////让控制器返回供选择的row个数
//- (NSInteger)numberOfRowsInSelector:(PickerView *)valueSelector;
//- (UIView *)selector:(PickerView *)valueSelector viewForRowAtIndex:(NSInteger)index;
//- (CGRect)rectForSelectionInSelector:(PickerView *)valueSelector;
//- (CGFloat)rowHeightInSelector:(PickerView *)valueSelector;
//- (CGFloat)rowWidthInSelector:(PickerView *)valueSelector;
//@optional
//- (UIView *)selector:(PickerView *)valueSelector viewForRowAtIndex:(NSInteger)index selected:(BOOL)selected;
//@end

@interface PickerView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<PickViewDelegate>delegate;
//@property (nonatomic, weak) id<PickViewDataSource>dataSource;
//@property (nonatomic, assign) BOOL shouldBeTransparent;
//@property (nonatomic, assign) BOOL horizontalScrolling;
//@property (nonatomic, strong) NSString *selectedImageName;
//@property (nonatomic, assign) BOOL debugEnabled;
//@property (nonatomic, assign) BOOL decelerates;
//
//- (void)selectRowAtIndex:(NSUInteger)index;
//- (void)selectRowAtIndex:(NSUInteger)index animated:(BOOL)animated;
//
//- (void)reloadData;

@end
