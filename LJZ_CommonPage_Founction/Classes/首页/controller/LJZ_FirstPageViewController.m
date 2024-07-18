//
//  LJZ_FirstPageViewController.m
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/17.
//

#import "LJZ_FirstPageViewController.h"
#import "Masonry/Masonry.h"
#import "LJZ_FirstPage_CustomImageView.h"
@interface LJZ_FirstPageViewController ()
{
    
}
@property(nonatomic,strong)UIButton *logoImgBtn;
@end

@implementation LJZ_FirstPageViewController

- (instancetype)init{
    if (self = [super init]) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
    
    
    LJZ_FirstPage_CustomImageView *customimgView = [LJZ_FirstPage_CustomImageView new];
    customimgView.spaceHeight = 20;
    [self.view addSubview:customimgView];
    [customimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(200);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(customimgView.spaceWith*3 + (customimgView.spaceHeight*3 + customimgView.firstBtnSize) + 0);
        make.height.mas_equalTo((3*customimgView.spaceHeight + customimgView.firstBtnSize) + 0);
    }];
    

//    UIButton *logoImgBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-20, customimgView.frame.origin.y + customimgView.frame.size.height, 40, 40)];
    _logoImgBtn = [UIButton new];
    [_logoImgBtn setTitle:@"选择按钮" forState:UIControlStateNormal];
    _logoImgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_logoImgBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _logoImgBtn.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:_logoImgBtn];
    [_logoImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_centerX).offset(-20);
        make.top.mas_equalTo(customimgView.mas_bottom);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    _logoImgBtn.alpha = 0;
    [_logoImgBtn addTarget:self action:@selector(logoClick:) forControlEvents:UIControlEventTouchUpInside];

    
}

// click
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    __weak __typeof(&*self)weakSelf = self;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations: ^{
        weakSelf.logoImgBtn.alpha = 1;
        [weakSelf.logoImgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_centerX).offset(-20);
            make.top.mas_equalTo(380);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.4f delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            [weakSelf.logoImgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20);
                make.top.mas_equalTo(weakSelf.view.mas_bottom).offset(-40);
                make.width.mas_equalTo(60);
                make.height.mas_equalTo(20);
            }];
            [self.view layoutIfNeeded];
            // 设置旋转动画的结束状态
//            weakSelf.logoImgBtn.transform = CGAffineTransformRotate(weakSelf.logoImgBtn.transform, M_PI * 1); // 旋转360度
        } completion:^(BOOL finished) {
            
        }];
    }];
    
//    [UIView animateWithDuration:1.4f delay:1.9 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
//        [weakSelf.logoImgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(20);
//            make.top.mas_equalTo(weakSelf.view.mas_bottom).offset(-40);
//            make.width.mas_equalTo(60);
//            make.height.mas_equalTo(20);
//        }];
//        [self.view layoutIfNeeded];
//        // 设置旋转动画的结束状态
//        weakSelf.logoImgBtn.transform = CGAffineTransformRotate(weakSelf.logoImgBtn.transform, M_PI * 1); // 旋转360度
//    } completion:^(BOOL finished) {
//        
//    }];
}

- (void)logoClick:(UIButton *)sender{
    __weak __typeof(&*self)weakSelf = self;
    
    [UIView animateWithDuration:1.4f delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [weakSelf.logoImgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_centerX).offset(-20);
            make.top.mas_equalTo(400);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        [self.view layoutIfNeeded];
        // 设置旋转动画的结束状态
        sender.transform = CGAffineTransformRotate(sender.transform, M_PI * 0.25); // 旋转360度
    } completion:^(BOOL finished) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
