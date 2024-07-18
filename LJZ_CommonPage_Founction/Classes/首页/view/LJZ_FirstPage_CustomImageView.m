//
//  LJZ_FirstPage_CustomImageView.m
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/18.
//

#import "LJZ_FirstPage_CustomImageView.h"

@interface LJZ_FirstPage_CustomImageView ()
@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,assign)CGFloat kScaleX;
@property(nonatomic,assign)CGFloat kScaleY;
@end

@implementation LJZ_FirstPage_CustomImageView

#pragma mark - setter
- (void)setSpaceHeight:(CGFloat)spaceHeight{
    _spaceHeight = spaceHeight;
    
    _start = CGPointMake(3*_spaceHeight, 0);
    
    [self _refreshUI];
}

#pragma mark - previte method
- (void)_refreshUI{
    for (int i=0; i<_btnArray.count; i++) {
        UIButton *btn = (UIButton *)_btnArray[i];
        btn.frame = CGRectMake(_start.y+i*_spaceWith, _start.x-i*_spaceHeight, i == 0 ? _firstBtnSize : _secondBtnSize+i*_spaceHeight, i == 0 ? _firstBtnSize : _secondBtnSize+i*_spaceHeight);
    }
}

#pragma mark - init ui
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        _btnArray = [NSMutableArray array];
        
        _kScaleX = [UIScreen mainScreen].bounds.size.width / 375.f;
        _kScaleY = [UIScreen mainScreen].bounds.size.height / 667.f;
        
        _spaceWith = 12*_kScaleX;
        _spaceHeight = 15*_kScaleX;
        _start = CGPointMake(3*_spaceHeight, 0);
        _firstBtnSize = 0;
        _secondBtnSize = 70*_kScaleX;
        
        
        for (int i=0; i<4; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(_start.y+i*_spaceWith, _start.x-i*_spaceHeight, i == 0 ? _firstBtnSize : _secondBtnSize+i*_spaceHeight, i == 0 ? _firstBtnSize : _secondBtnSize+i*_spaceHeight)];
            if (i == 0) {
                btn.backgroundColor = UIColor.yellowColor;
            }else if (i == 1) {
                btn.backgroundColor = UIColor.purpleColor;
            }else if (i == 2) {
                btn.backgroundColor = UIColor.blueColor;
            }else if (i == 3) {
                btn.backgroundColor = UIColor.grayColor;
            }
            btn.layer.cornerRadius = 8;
            btn.layer.masksToBounds = YES;
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_btnArray addObject:btn];
            
        }
    }
    return self;
}

#pragma mark - click
- (void)btnClick:(UIButton *)sender{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(_start.y, _start.x, _firstBtnSize, _firstBtnSize)];
    btn.backgroundColor = UIColor.blackColor;
    btn.layer.cornerRadius = 8;
    btn.layer.masksToBounds = YES;
    [self insertSubview:btn atIndex:0];
    [_btnArray insertObject:btn atIndex:0];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // 动画
    __weak __typeof(&*self)weakSelf = self;
    for (int i=0; i<_btnArray.count; i++) {
        UIButton *btn = (UIButton *)_btnArray[i];
        [UIView animateWithDuration:1.0f animations:^{
            if (i == 0) {
                btn.frame = CGRectMake(weakSelf.start.y+i*weakSelf.spaceWith, weakSelf.start.x-i*weakSelf.spaceHeight, weakSelf.firstBtnSize, weakSelf.firstBtnSize);
            }else if (i == weakSelf.btnArray.count-1) {
                btn.alpha = 0;
                btn.frame = CGRectMake(weakSelf.start.y+i*weakSelf.spaceWith + 100, weakSelf.start.x-i*weakSelf.spaceHeight, weakSelf.secondBtnSize+i*weakSelf.spaceHeight, weakSelf.secondBtnSize+i*weakSelf.spaceHeight);
            }else{
                btn.frame = CGRectMake(weakSelf.start.y+i*weakSelf.spaceWith, weakSelf.start.x-i*weakSelf.spaceHeight, weakSelf.secondBtnSize+i*weakSelf.spaceHeight, weakSelf.secondBtnSize+i*weakSelf.spaceHeight);
            }
        } completion:^(BOOL finished) {
            NSLog(@"index:%d",i);
            if (i == 4) {
                [weakSelf.btnArray removeLastObject];
                [btn removeFromSuperview];
            }
        }];
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
