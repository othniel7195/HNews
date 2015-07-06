//
//  AdWithTableView.h
//  HeartHealth
//
//  Created by 赵锋 on 15/7/6.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//
// 新闻和列表的View
#import "HHBaseView.h"

@interface AdWithTableView : HHBaseView


-(instancetype)initWithFrame:(CGRect)frame WithImgURLs:(NSArray *)imgUrls titles:(NSArray *)titles newsArr:(NSArray *)newsArr;
@end
