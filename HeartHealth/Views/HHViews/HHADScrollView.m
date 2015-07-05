//
//  HHADScrollView.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/3.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHADScrollView.h"
#import "UIImageView+AFNetworking.h"
@interface HHADScrollView ()
@property(nonatomic, strong) UIScrollView *adScrollView;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, assign) int currentPageIndex;
@property(nonatomic, strong) UILabel *noteTitleLabel;
@property(nonatomic, strong) UIView *noteView;
@end

@implementation HHADScrollView


-(instancetype)initWithFrame:(CGRect)frame imageUrls:(NSArray *)imgUrls titleArray:(NSArray *)titArr
{
    self =[super initWithFrame:frame];
    if (self) {
        
         NSMutableArray *tempArray=[NSMutableArray arrayWithArray:imgUrls];
        [tempArray insertObject:[imgUrls objectAtIndex:([imgUrls count]-1)] atIndex:0];
        [tempArray addObject:[imgUrls objectAtIndex:0]];
        self.imagesUrls=[NSArray arrayWithArray:tempArray];
        
        _imagesUrls=imgUrls;
        _titleArray=titArr;
        
        self.userInteractionEnabled=YES;
        
        NSUInteger pageCount=_imagesUrls.count;
        
        [self addSubview:self.adScrollView];
        
        [self addSubview:self.noteView];
        
        [self.noteView addSubview:self.noteTitleLabel];
        
        [self.noteView addSubview:self.pageControl];
        
        for (int i=0; i<pageCount; i++) {
            
            NSString *imgURL=self.imagesUrls[i];
            UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
            if ([imgURL hasPrefix:@"http://"]) {
                
                [imageView setImageWithURL:[NSURL URLWithString:imgURL]];
            }
            
            imageView.frame=CGRectMake(frame.size.width*i, 0, frame.size.width, frame.size.height);
            imageView.tag=i;
            
            UITapGestureRecognizer *touchImageView=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
            imageView.userInteractionEnabled=YES;
            [imageView addGestureRecognizer:touchImageView];
            
            [self.adScrollView addSubview:imageView];
            
        }
        
        
        self.noteTitleLabel.text=self.titleArray[0];
        
    }
    
    return self;
}


#pragma mark ---布局
-(void)initConstraints
{
    [self.adScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(@0);
        make.top.mas_equalTo(@0);
        make.size.mas_equalTo(self.frame.size);
        
    }];
    
    float pageControlWidth=(self.imagesUrls.count-2)*10.0f+40.f;
    float pagecontrolHeight=20.0f;
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.frame.size.width-pageControlWidth);
        make.top.mas_equalTo(6);
        make.width.mas_equalTo(pageControlWidth);
        make.height.mas_equalTo(pagecontrolHeight);
        
    }];
    
    [self.noteView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.bounds.size.height-33);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, 33));
        
    }];
    
    [self.noteTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(6);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width-pageControlWidth,20));
    }];
    
}

#pragma mark -- 视图
-(UIScrollView *)adScrollView
{
    if (_adScrollView==nil) {
        
        UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectZero];
        scrollView.pagingEnabled=YES;
        scrollView.contentSize=CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds)*self.imagesUrls.count);
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.scrollsToTop=NO;
        scrollView.delegate=self;
        scrollView.contentOffset=CGPointMake(self.frame.size.width, 0);
        
        _adScrollView=scrollView;
    }
    
    return _adScrollView;
}

-(UILabel *)noteTitleLabel
{
    if (_noteTitleLabel==nil) {
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor=[UIColor clearColor];
        label.font=[UIFont systemFontOfSize:13];
        
        _noteTitleLabel=label;
    }
    
    return _noteTitleLabel;
}

-(UIView *)noteView
{
    if (_noteView==nil) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5];
        
        _noteView=view;
    }
    return _noteView;
}

-(UIPageControl *)pageControl
{
    if (_pageControl==nil) {
        
        UIPageControl * pageControl=[[UIPageControl alloc]initWithFrame:CGRectZero];
        pageControl.currentPage=0;
        pageControl.numberOfPages=(self.imagesUrls.count-2);
        
        _pageControl=pageControl;

    }
    
    return _pageControl;
}

#pragma mark --scrollview  delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = self.adScrollView.frame.size.width;
    int page = floor((self.adScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.currentPageIndex=page;
    
    self.pageControl.currentPage=(page-1);
    NSInteger titleIndex=page-1;
    if (titleIndex==[self.titleArray count]) {
        titleIndex=0;
    }
    if (titleIndex<0) {
        titleIndex=[self.titleArray count]-1;
    }
    [self.noteTitleLabel setText:[self.titleArray objectAtIndex:titleIndex]];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.currentPageIndex==0) {
        
        [scrollView setContentOffset:CGPointMake(([self.imagesUrls count]-2)*self.frame.size.width, 0)];
    }
    if (self.currentPageIndex==([self.imagesUrls count]-1)) {
        
        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
        
    }
    
}

#pragma mark -- tap

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(adScrollViewDidClicked:)]) {
        [self.delegate adScrollViewDidClicked:sender.view.tag];
    }
}

@end
