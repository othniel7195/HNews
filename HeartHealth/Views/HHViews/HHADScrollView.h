//
//  HHADScrollView.h
//  HeartHealth
//
//  Created by 赵锋 on 15/7/3.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHBaseView.h"
@protocol HHADScrollViewDelegate;

@interface HHADScrollView : HHBaseView<UIScrollViewDelegate>


@property(nonatomic, strong) NSArray *imagesUrls;
@property(nonatomic, strong) NSArray *titleArray;
@property(nonatomic, weak) id<HHADScrollViewDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame imageUrls:(NSArray *)imgUrls titleArray:(NSArray *)titArr;

@end

@protocol HHADScrollViewDelegate <NSObject>

@optional
-(void)adScrollViewDidClicked:(NSUInteger)index;

@end