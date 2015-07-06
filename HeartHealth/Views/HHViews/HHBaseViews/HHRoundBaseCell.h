//
//  HHRoundBaseCell.h
//  HeartHealth
//
//  Created by 赵锋 on 15/7/6.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//
// 带圆角的 基础cell

#import "HHBaseCell.h"

@interface HHRoundBaseCell : HHBaseCell

/**
 * 使用圆角cell 其他空件要加在roundContentView上 而非contentView上
 */
@property(nonatomic, strong,readonly)UIView *roundContentView;

/**
 *  roundEdgeInsets 圆角四周的间隔
 *  radius:圆角半径
 *  borderWith 边框大小
 *  borderColor 边框颜色
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier roundEdgeInsets:(UIEdgeInsets)inserts radius:(CGFloat)radius
                  borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
