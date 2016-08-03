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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.rowHeight = 45;//[self.dataSource rowHeightInSelector:self];
        _tableView.contentInset = UIEdgeInsetsMake( _selectionRect.origin.y, 0,_tableView.frame.size.height - _selectionRect.origin.y - _selectionRect.size.height  , 0);//UIEdgeInsetsMake( _selectionRect.origin.y, 0, _tableView.frame.size.height - _selectionRect.origin.y - _selectionRect.size.height  , 0);
        
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:_tableView];
        
        UIImageView *selectionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myself_personalData_selected_bg"]];
        selectionImageView.frame = CGRectMake( 0,self.frame.size.height/2-22.5, _tableView.frame.size.width,45 );//_selectionRect;
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
    //NSInteger rows = [self.dataSource numberOfRowsInSelector:self];
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"cell";//[NSString stringWithFormat:@"%ld%ldcell",(long)indexPath.section,(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    //NSLog(@"%lu",(unsigned long)cell.contentView.subviews.count);
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    if (cell.contentView.subviews.count == 0) {
        UILabel *show = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 45)];
        show.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        //show.backgroundColor = [UIColor greenColor];
        show.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:show];
    }else{
        NSArray *arr = [[NSArray alloc]initWithArray:cell.contentView.subviews];
        for (UIView *view in arr) {
            [view removeFromSuperview];
        }
        UILabel *show = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 45)];
        show.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        show.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:show];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //    NSArray *contentSubviews = [cell.contentView subviews];
    //    //We the content view already has a subview we just replace it, no need to add it again
    //    //hopefully ARC will do the rest and release the old retained view
    //    if ([contentSubviews count] >0 ) {
    //        UIView *contentSubV = [contentSubviews objectAtIndex:0];
    //
    //        //This will release the previous contentSubV
    //        [contentSubV removeFromSuperview];
    //        BOOL selected = indexPath.row == selectedIndexPath.row;
    //        UIView *viewToAdd = nil;
    //        if ([self.dataSource respondsToSelector:@selector(selector:viewForRowAtIndex:selected:)]) {
    //            viewToAdd = [self.dataSource selector:self viewForRowAtIndex:indexPath.row selected:selected];
    //        } else {
    //            viewToAdd = [self.dataSource selector:self viewForRowAtIndex:indexPath.row];
    //        }
    //        contentSubV = viewToAdd;
    //        if (self.debugEnabled) {
    //            viewToAdd.layer.borderWidth = 1.0;
    //            viewToAdd.layer.borderColor = [UIColor redColor].CGColor;
    //        }
    //        [cell.contentView addSubview:contentSubV];
    //    }
    //    else {
    //        BOOL selected = indexPath.row == selectedIndexPath.row;
    //        UIView *viewToAdd = nil;
    //        if ([self.dataSource respondsToSelector:@selector(selector:viewForRowAtIndex:selected:)]) {
    //            viewToAdd = [self.dataSource selector:self viewForRowAtIndex:indexPath.row selected:selected];
    //        } else {
    //            viewToAdd = [self.dataSource selector:self viewForRowAtIndex:indexPath.row];
    //        }
    //        //This is a new cell so we just have to add the view
    //        if (self.debugEnabled) {
    //            viewToAdd.layer.borderWidth = 1.0;
    //            viewToAdd.layer.borderColor = [UIColor redColor].CGColor;
    //        }
    //        [cell.contentView addSubview:viewToAdd];
    //
    //    }
    //
    //    if (self.debugEnabled) {
    //        cell.layer.borderColor = [UIColor greenColor].CGColor;
    //        cell.layer.borderWidth = 1.0;
    //    }
    //
    //    if (self.horizontalScrolling) {
    //        CGAffineTransform rotateTable = CGAffineTransformMakeRotation(M_PI_2);
    //        cell.transform = rotateTable;
    //    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableView) {//UITableViewScrollPositionBottom UITableViewScrollPositionNone UITableViewScrollPositionTop UITableViewScrollPositionMiddle
        selectedIndexPath = indexPath;
        [_tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
        [self.delegate selector:_tableView didSelectRowAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        [self scrollToTheSelectedCell];
    }
}
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
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height/2)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return tableView.frame.size.height/2;
//}
//- (void)selectRowAtIndex:(NSUInteger)index{}
//- (void)selectRowAtIndex:(NSUInteger)index animated:(BOOL)animated{}
//
//- (void)reloadData{}



@end
