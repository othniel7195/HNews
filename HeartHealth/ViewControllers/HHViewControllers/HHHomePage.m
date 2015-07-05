//
//  HHHomePage.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHHomePage.h"
#import "HHDetailWebView.h"
#import "SDCycleScrollView.h"
@interface HHHomePage ()<SDCycleScrollViewDelegate>

@property(nonatomic, strong) SDCycleScrollView *adScrollView;
@end

@implementation HHHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    
    
    [self.view addSubview:self.adScrollView];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    self.adScrollView.titlesGroup=titles;
    self.adScrollView.imageURLStringsGroup=imagesURLStrings;
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -- 视图
-(SDCycleScrollView *)adScrollView
{
    if (_adScrollView==nil) {
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180) imageURLStringsGroup:nil]; // 模拟网络延时情景
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView.delegate = self;
        cycleScrollView.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];

        _adScrollView=cycleScrollView;
    }
    
    return _adScrollView;
}

#pragma mark --图片轮播
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    [OLog showMessage:@"---点击了第%ld张图片", index];
}

#pragma mark -- parent
-(void)initParams
{
    self.viewControllerKey=@"HHHomePage";
}
-(BOOL)rightHandleButtonHidden
{
    return  NO;
}


@end
