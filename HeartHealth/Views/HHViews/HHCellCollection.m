//
//  HHCellCollection.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/3.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHCellCollection.h"
@implementation HHCellCollection

#pragma mark -- 注册cell
+(void)registerUserHeadCell:(UITableView *)tableView
{
    [tableView registerClass:[HHUserHeadCell class] forCellReuseIdentifier:UserHeadCell];
}
+(void)registerLabelCell:(UITableView *)tableView
{
    [tableView registerClass:[HHLabelCell class] forCellReuseIdentifier:LabelCell];
}

#pragma mark -- 生成并复用cell
+(UITableViewCell *)cellForUserHead:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath headImage:(UIImage *)headImage userName:(NSString *)userName
{
    HHUserHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:UserHeadCell forIndexPath:indexPath];
    
    cell.userName = userName;
    cell.headImage = headImage;
    
    [cell initConstraints];
    
    return cell;
}
+(UITableViewCell *)cellForLabel:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
                     normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage
                       labelInfo:(NSString *)labelInfo
{
    HHLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:LabelCell forIndexPath:indexPath];
    cell.indexTag=indexPath.row;
    cell.normalLabelImage=normalImage;
    cell.selectLabelImage=selectImage;
    cell.labelInfo=labelInfo;
    
    [cell initConstraints];
    
    return cell;
}
+(UITableViewCell *)cellForNormalNews:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath imgUrl:(NSString *)imgUrl title:(NSString *)title content:(NSString *)content
{
    HHNormalNewCell *cell= [tableView dequeueReusableCellWithIdentifier:NormalNewsCell];
    if (cell==nil) {
        
        cell=[[HHNormalNewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NormalNewsCell roundEdgeInsets:UIEdgeInsetsMake(10, 10, 0, 10) radius:6 borderWidth:2.0 borderColor:[UIColor lightGrayColor]];
    }
    cell.imgURL=imgUrl;
    cell.title=title;
    cell.content=content;
    
    [cell initConstraints];
    
    return cell;
}
@end
