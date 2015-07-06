//
//  HHCellCollection.h
//  HeartHealth
//
//  Created by 赵锋 on 15/7/3.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HHUserHeadCell.h"
#import "HHLabelCell.h"
#import "HHNormalNewCell.h"
#import "Okeys.h"
@interface HHCellCollection : NSObject

///注册用户头像Cell
+(void)registerUserHeadCell:(UITableView *)tableView;

///生成用户头像Cell 并复用
+(UITableViewCell *)cellForUserHead:(UITableView *)tableView  indexPath:(NSIndexPath *)indexPath headImage:(UIImage *)headImage userName:(NSString *)userName;

///注册标签cell
+(void)registerLabelCell:(UITableView *)tableView;
///生成标签cell 并复用
+(UITableViewCell *)cellForLabel:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
                     normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage
                       labelInfo:(NSString *)labelInfo;
///生成普通新闻cell 并复用
+(UITableViewCell *)cellForNormalNews:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath imgUrl:(NSString *)imgUrl title:(NSString *)title content:(NSString *)content;

@end
