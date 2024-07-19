//
//  LJZ_FirstPage_CustomRefreshImageView.m
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/19.
//

#import "LJZ_FirstPage_CustomRefreshImageView.h"
#import "Masonry/Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LJZ_FirstPage_CustomRefreshImageView()
@property(nonatomic,strong)NSMutableArray *viewArray;
@property(nonatomic,assign)CGFloat kScaleX;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,assign)NSInteger lastIndex;
@end

@implementation LJZ_FirstPage_CustomRefreshImageView

#pragma mark - setter
- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    //
    for (int i=0; i<_viewArray.count; i++) {
        UIImageView *img = (UIImageView *)_viewArray[i];
        LJZ_FirstPage_CustomImageModel *model = _dataSource[i];
        [img sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@""] completed:nil];
        
    }
}

#pragma mark - click
- (void)tap:(UITapGestureRecognizer *)gesture{
    if (_clickBlock) {// 返回移除的model及index
        _clickBlock(_dataSource[_index],_index);
    }
    if (_lastIndex < _dataSource.count-1) {
        _lastIndex++;
    }else{
        _lastIndex = 0;
    }
    LJZ_FirstPage_CustomImageModel *model = _dataSource[_lastIndex];
    NSLog(@"addImageView:%@-lastIndex:%ld",model.photo,_lastIndex);
    
    UIImageView *img = [UIImageView new];
    img.alpha = 0;
    img.backgroundColor = UIColor.blackColor;
    img.layer.cornerRadius = 8;
    img.layer.masksToBounds = YES;
    [self insertSubview:img atIndex:0];
    [_viewArray addObject:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(3*_spaceHeight);
        make.width.height.mas_equalTo(_firstBtnSize);
    }];
    img.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [img addGestureRecognizer:tap];
    [img sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@""] completed:nil];
    
    
    // 动画
    __weak __typeof(&*self)weakSelf = self;
    for (int i=0; i<_viewArray.count; i++) {
        UIImageView *img = (UIImageView *)_viewArray[i];
        // 动画持续时间秒
        // 动画开始前的延迟时间
        // 弹簧系数，控制动画的弹性
        // 初始弹簧速度
        // 动画曲线选项
        [UIView animateWithDuration:0.4f delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            [img mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo((4-i)*weakSelf.spaceWith);
                make.top.mas_equalTo((i-1)*weakSelf.spaceHeight);
                make.width.height.mas_equalTo((weakSelf.firstBtnSize)-(i-1)*weakSelf.spaceHeight);
                if (i == 1) {// 第0位需要删除
                    make.bottom.mas_equalTo(0);
                    make.right.mas_equalTo(0);
                }
            }];
            if (i == 0) {
                img.alpha = 0;
                // 设置旋转动画的结束状态
                img.transform = CGAffineTransformRotate(img.transform, M_PI * 1/18); // 旋转360度
            }else if (i == 1) {
                img.alpha = 1;
            }else if (i == 2) {
                img.alpha = 0.5;
            }else if (i == 3) {
                img.alpha = 0.25;
            }else if (i == weakSelf.viewArray.count-1) {
                img.alpha = 0;
            }
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
//            NSLog(@"index:%d",i);
            if (i == 0) {
                [weakSelf.viewArray removeObjectAtIndex:0];
                [img removeFromSuperview];
            }
        }]; // 动画完成后的回调（这里不需要回调，所以是nil）
    }
    
    if (_index < _dataSource.count-1) {
        _index++;
    }else{
        _index = 0;
    }
}

#pragma mark - init ui
- (void)layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"---width:%f\nx:%f",self.frame.size.width,self.frame.origin.x);
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        
        _index = 0;
        _lastIndex = 3;
        _viewArray = [NSMutableArray array];
        _kScaleX = [UIScreen mainScreen].bounds.size.width / 375.f;
        
        _spaceWith = 12*_kScaleX;
        _spaceHeight = 15*_kScaleX;
        _firstBtnSize = 100*_kScaleX;


        for (int i=0; i<4; i++) {
            UIImageView *img = [UIImageView new];
            if (i == 0) {
                img.alpha = 1;
                img.backgroundColor = UIColor.yellowColor;
            }else if (i == 1) {
                img.backgroundColor = UIColor.purpleColor;
                img.alpha = 0.5;
            }else if (i == 2) {
                img.backgroundColor = UIColor.blueColor;
                img.alpha = 0.25;
            }else if (i == 3) {
                img.backgroundColor = UIColor.grayColor;
                img.alpha = 0;
            }
            img.layer.cornerRadius = 8;
            img.layer.masksToBounds = YES;
            [self insertSubview:img atIndex:0];
            [_viewArray addObject:img];
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo((3-i)*_spaceWith);
                make.top.mas_equalTo(i*_spaceHeight);
                make.width.height.mas_equalTo(_firstBtnSize-i*_spaceHeight);
                if (i == 0) {
                    make.bottom.mas_equalTo(0);
                    make.right.mas_equalTo(0);
                }
            }];
            img.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [img addGestureRecognizer:tap];

        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
