//
//  AdWithTableView.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/6.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "AdWithTableView.h"
#import "SDCycleScrollView.h"
#import "HHCellCollection.h"
@interface AdWithTableView ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) SDCycleScrollView *adScrollView;
@property(nonatomic, strong) UITableView *newsList;
@property(nonatomic, strong) NSArray *imgURLs;//图片url数组
@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSArray *newsArr;//新闻内容数组
@property(nonatomic, strong) NSMutableDictionary *cellHeights;
@end

@implementation AdWithTableView

-(instancetype)initWithFrame:(CGRect)frame WithImgURLs:(NSArray *)imgUrls titles:(NSArray *)titles newsArr:(NSArray *)newsArr
{
    self=[super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _imgURLs=imgUrls;
        _titles =titles;
        _newsArr=newsArr;
        
        [self addSubview:self.adScrollView];
        [self addSubview:self.newsList];
        
        self.adScrollView.titlesGroup=_titles;
        self.adScrollView.imageURLStringsGroup=_imgURLs;
        
        [self initConstraints];
    }
    
    return self;
}

#pragma mark --布局
-(void)initConstraints
{
    [self.adScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.and.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, 180));
    }];
    
    [self.newsList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.adScrollView.mas_bottom).offset(10);
        make.width.mas_equalTo(self.bounds.size.width);
        make.bottom.mas_equalTo(10);
    }];
}

#pragma mark -- 视图
-(SDCycleScrollView *)adScrollView
{
    if (_adScrollView==nil) {
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0) imageURLStringsGroup:nil]; // 模拟网络延时情景
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView.delegate = self;
        cycleScrollView.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
        
        _adScrollView=cycleScrollView;
    }
    
    return _adScrollView;
}

-(UITableView *)newsList
{
    if (_newsList==nil) {
        
        UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.delegate=self;
        tableView.dataSource=self;
    
        _newsList=tableView;
    }
    
    return _newsList;
}

#pragma mark --图片轮播
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

#pragma mark  --table delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.newsArr.count>0) {
        return 1;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    UITableViewCell *cell=[HHCellCollection cellForNormalNews:tableView indexPath:indexPath imgUrl:@"AAAAA" title:@"标题标题标题标题标题标题标题标题标题标题标题标题" content:@"内容内容内容内容内容内容内容内容内容内容内容内容"];
    
    NSNumber *cellHeight=[cell valueForKey:@"cellHeight"];
    
    if (self.cellHeights==nil) {
        self.cellHeights=[NSMutableDictionary dictionary];
    }
    NSString *cellHeightKey=[NSString stringWithFormat:@"%ld_%ld",indexPath.section,indexPath.row];
    [self.cellHeights setObject:cellHeight forKey:cellHeightKey];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellHeightKey=[NSString stringWithFormat:@"%ld_%ld",indexPath.section,indexPath.row];
    
    return 80;//[[self.cellHeights objectForKey:cellHeightKey] floatValue];
}

#pragma mark -- tabel datasource



@end
