//
//  HHNormalNewCell.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/6.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//
//左边一个图片 右边 上下个一个label

#import "HHNormalNewCell.h"

@interface HHNormalNewCell ()
@property (nonatomic, strong)UIImageView *newsImg;
@property (nonatomic, strong)UILabel * newsTitleLabel;
@property (nonatomic, strong)UILabel *newsContentLabel;
@property (nonatomic, strong ,readwrite) NSNumber *cellHeight;
@end

@implementation HHNormalNewCell
@synthesize cellHeight=_cellHeight;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier roundEdgeInsets:(UIEdgeInsets)inserts radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier roundEdgeInsets:inserts radius:radius borderWidth:borderWidth borderColor:borderColor];
    
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.newsImg];
        [self.contentView addSubview:self.newsTitleLabel];
        [self.contentView addSubview:self.newsContentLabel];
        
    }
    
    return self;
}


#pragma mark -- 布局
-(void)initConstraints
{
    
    [self.newsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(4);
        make.centerY.mas_equalTo(self.roundContentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.newsImg.mas_right).offset(5.0);
        make.top.mas_equalTo(8.0);
        make.right.mas_equalTo(self.roundContentView.mas_right).offset(-5);
        make.height.mas_greaterThanOrEqualTo(21.0);
    }];
    
    [self.newsContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.newsTitleLabel.mas_left);
        make.top.mas_equalTo(self.newsTitleLabel.mas_bottom).offset(5.0);
        make.width.mas_equalTo(self.newsTitleLabel.mas_width);
        make.height.mas_greaterThanOrEqualTo(21.0);
    }];

    [self.roundContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.newsContentLabel.mas_bottom);
        
    }];
    
    [self initBaseConstraints];
    
    CGSize  size  =[self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    self.cellHeight=[NSNumber numberWithFloat:(size.height+1.0)];
    
    
    
    [OLog showMessage:@"normal cell height :%@",self.cellHeight];
}

#pragma mark -- 视图

-(UIImageView *)newsImg
{
    if (_newsImg==nil) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
        _newsImg=imageView;
    }
    
    return _newsImg;
}

-(UILabel *)newsTitleLabel
{
    if (_newsTitleLabel==nil) {
        UILabel * label=[[UILabel alloc] initWithFrame:CGRectZero];
        label.font=[UIFont systemFontOfSize:14.0];
        label.textColor=[UIColor blackColor];
        label.numberOfLines=0;
        
        _newsTitleLabel=label;
    }
    
    return _newsTitleLabel;
}

-(UILabel *)newsContentLabel
{
    if (_newsContentLabel==nil) {
        UILabel * label=[[UILabel alloc] initWithFrame:CGRectZero];
        label.font=[UIFont systemFontOfSize:14.0];
        label.textColor=[UIColor darkTextColor];
        label.numberOfLines=0;
    
        _newsContentLabel=label;
    }
    return _newsContentLabel;
}


#pragma mark -- 赋值
-(void)setImgURL:(NSString *)imgURL
{
    if (_imgURL!=imgURL) {
        _imgURL=imgURL;
    }
}
-(void)setTitle:(NSString *)title
{
    if (_title!=title) {
        _title=title;
        self.newsTitleLabel.text=_title;
    }
}
-(void)setContent:(NSString *)content
{
    if (_content!=content) {
        _content=content;
        self.newsContentLabel.text=_content;
    }
}
@end
