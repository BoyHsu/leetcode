//
//  TableViewCell.h
//  CellExchageDemo
//
//  Created by ada_PC007 on 2017/5/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewCell;
@protocol TableViewCellDelegate <NSObject>

- (void)cell:(TableViewCell *)cell didEndEditingWithContent:(NSString *)content;

@end

@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) id<TableViewCellDelegate> delegate;

@end
