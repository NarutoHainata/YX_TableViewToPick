//
//  PickerView.m
//  YX_TableViewToPick
//
//  Created by yang on 16/8/3.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "PickerView.h"

@implementation PickerView{
    
    UITableView *_tableView;
    CGRect _selectionRect;
    NSIndexPath *selectedIndexPath;
}

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _selectionRect = CGRectMake( 0,self.frame.size.height/2-22.5, 45.0, 45.0);//[self.dataSource rectForSelectionInSelector:self];
        //创建tableView
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //隐藏cell的间隔线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //设置cell的高度
        NSLog(@"%f",[self.dataSource rowHeightInSelector:self]);
        
        //设置留白
        _tableView.contentInset = UIEdgeInsetsMake( _selectionRect.origin.y, 0,_tableView.frame.size.height - _selectionRect.origin.y - _selectionRect.size.height  , 0);//UIEdgeInsetsMake( _selectionRect.origin.y, 0, _tableView.frame.size.height - _selectionRect.origin.y - _selectionRect.size.height  , 0);
        //隐藏滚动条
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.rowHeight = 45;
        [self addSubview:_tableView];
        //设置背景图片 设置透明度 位置在视图中间那一个cell
        UIImageView *selectionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myself_personalData_selected_bg"]];
        
        selectionImageView.frame = CGRectMake( 0,self.frame.size.height/2-_tableView.rowHeight/2, _tableView.frame.size.width,_tableView.rowHeight );
        selectionImageView.alpha = 0.7;
        
        [self addSubview:selectionImageView];
        
    }
    return self;
}
#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld",(long)[self.dataSource numberOfRowsInSelector:self]);
    return [self.dataSource numberOfRowsInSelector:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    //设置cell的显示内容
    UILabel *show = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 45)];
    show.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    show.textAlignment = NSTextAlignmentCenter;

    if (cell.contentView.subviews.count == 0) {
        [cell.contentView addSubview:show];
    }else{
        NSArray *arr = [[NSArray alloc]initWithArray:cell.contentView.subviews];
        for (UIView *view in arr) {
            [view removeFromSuperview];
        }
        [cell.contentView addSubview:show];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
       return cell;
}
#pragma mark 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {
        
        selectedIndexPath = indexPath;
        //滚动到点击的那一个cell 四种选择
        //UITableViewScrollPositionBottom UITableViewScrollPositionNone UITableViewScrollPositionTop UITableViewScrollPositionMiddle
        [_tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
        //通知vc点击了哪一个cell
        [self.delegate selector:_tableView didSelectRowAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}
#pragma mark拖动的时候
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        [self scrollToTheSelectedCell];
    }
}
#pragma mark 拖动执行的关键代码
- (void)scrollToTheSelectedCell {
    
    CGRect selectionRectConverted = [self convertRect:_selectionRect toView:_tableView];
    NSArray *indexPathArray = [_tableView indexPathsForRowsInRect:selectionRectConverted];
    
    CGFloat intersectionHeight = 0.0;
    
    for (NSIndexPath *index in indexPathArray) {
        //looping through the closest cells to get the closest one
        UITableViewCell *cell = [_tableView cellForRowAtIndexPath:index];
        CGRect intersectedRect = CGRectIntersection(cell.frame, selectionRectConverted);
        
        if (intersectedRect.size.height>=intersectionHeight) {
            selectedIndexPath = index;
            intersectionHeight = intersectedRect.size.height;
        }
    }
    if (selectedIndexPath!=nil) {
        //As soon as we elected an indexpath we just have to scroll to it
        [_tableView scrollToRowAtIndexPath:selectedIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        [self.delegate selector:_tableView didSelectRowAtIndex:selectedIndexPath.row];
        [_tableView reloadData];
    }
}
- (void)reloadData{
    [_tableView reloadData];
}



@end
