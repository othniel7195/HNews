//
//  HHRoundBaseCell.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/6.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHRoundBaseCell.h"

@interface HHRoundBaseCell ()

@property(nonatomic, strong,readwrite) UIView *roundContentView;
@property(nonatomic, assign) UIEdgeInsets roundEdgeInsets;
@property(nonatomic, assign) CGFloat radius;
@property(nonatomic, assign) CGFloat borderWidth;
@property(nonatomic, strong) UIColor *borderColor;

@property(nonatomic, assign) BOOL isOwnInit;//判断有没走自己得初始化方法

@end

@implementation HHRoundBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        if (_isOwnInit==NO) {
            [OLog showMessage:@"直接走了系统的初始化"];
            _roundEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
            _radius=0.0;
            _borderColor=[UIColor clearColor];
            _borderWidth=0.0;
        }else{
            [OLog showMessage:@"走了自己得初始化方法 %@",NSStringFromUIEdgeInsets(_roundEdgeInsets)];
        }
        
        [self.contentView addSubview:self.roundContentView];
        
        [self initBaseConstraints];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier roundEdgeInsets:(UIEdgeInsets)inserts radius:(CGFloat)radius
                  borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    _roundEdgeInsets=inserts;
    _radius=radius;
    _borderWidth=borderWidth;
    _borderColor=borderColor;
    _isOwnInit=YES;
    
    self=[self initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

#pragma mark -- 布局

-(void)initBaseConstraints
{
   [self.roundContentView mas_makeConstraints:^(MASConstraintMaker *make) {
       
       make.edges.mas_equalTo(self.contentView).insets=self.roundEdgeInsets;
       
   }];
    
    
    CGSize  size  =[self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    [OLog showMessage:@"round base  Cell height :%f",size.height];
}

#pragma mark -- 视图
-(UIView *)roundContentView
{
    if (_roundContentView==nil) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
        view.layer.masksToBounds=YES;
        view.layer.cornerRadius=self.radius;
        view.layer.borderWidth=self.borderWidth;
        view.layer.borderColor=self.borderColor.CGColor;

        _roundContentView=view;
    }
    
    return _roundContentView;
}

@end
