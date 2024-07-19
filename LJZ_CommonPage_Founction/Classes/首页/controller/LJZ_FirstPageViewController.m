//
//  LJZ_FirstPageViewController.m
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/17.
//

#import "LJZ_FirstPageViewController.h"
#import "Masonry/Masonry.h"
#import "LJZ_FirstPage_CustomImageView.h"
#import "LJZ_FirstPage_CustomRefreshImageView.h"
#import "LJZ_FirstPage_CustomImageModel.h"

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
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<11; i++) {
        LJZ_FirstPage_CustomImageModel *model = [[LJZ_FirstPage_CustomImageModel alloc] init];
        model.providerName = [NSString stringWithFormat:@"河北省-%d",i];
        model.cityName = @"石家庄";
        model.countryName = @"中国";
        model.residenceYear = @"2024-07-19 09:33";
        if (i == 0) {
            model.photo = @"https://q1.itc.cn/q_70/images03/20240430/59fe8596e4cb4824a6f27315328a3559.jpeg";
        }else if (i == 1) {
            model.photo = @"https://wxls-cms.oss-cn-hangzhou.aliyuncs.com/online/2024-04-18/218da022-f4bf-456a-99af-5cb8e157f7b8.jpg";
        }else if (i == 2) {
            model.photo = @"https://wx4.sinaimg.cn/mw690/0072z9AKly1hr7qwzgk26j31401dtn2r.jpg";
        }else if (i == 3) {
            model.photo = @"https://inews.gtimg.com/om_bt/OGlQWfsaAoKkuCcMZ2o9IVEPqd-72DQy5EAN02XBHUwfYAA/641";
        }else if (i == 4) {
            model.photo = @"https://img0.baidu.com/it/u=3399087670,1367521109&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=625";
        }else if (i == 5) {
            model.photo = @"https://wx2.sinaimg.cn/mw690/008kP1QOgy1hra4yycsulj30u01hcdvc.jpg";
        }else if (i == 6) {
            model.photo = @"https://img1.baidu.com/it/u=2629873009,4289466017&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1146";
        }else if (i == 7) {
            model.photo = @"https://img2.baidu.com/it/u=153122728,4086122618&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=667";
        }else if (i == 8) {
            model.photo = @"https://wx4.sinaimg.cn/mw690/001rOLfPly1hraxdzfoacj60u01hck4v02.jpg";
        }else if (i == 9) {
            model.photo = @"https://q1.itc.cn/q_70/images03/20240430/59fe8596e4cb4824a6f27315328a3559.jpeg";
        }else{
            model.photo = @"https://inews.gtimg.com/om_bt/OGlQWfsaAoKkuCcMZ2o9IVEPqd-72DQy5EAN02XBHUwfYAA/641";
        }
        
        model.providerPageUrl = @"www.baidu.com";
        [arr addObject:model];
    }
    
    
    LJZ_FirstPage_CustomRefreshImageView *v = [LJZ_FirstPage_CustomRefreshImageView new];
    v.userInteractionEnabled = YES;
    v.dataSource = arr;
    [v setClickBlock:^(LJZ_FirstPage_CustomImageModel * _Nonnull mod, NSInteger index) {
        NSLog(@"click index:%ld,url:%@,providerName:%@",index,mod.photo,mod.providerName);
    }];
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(50);
    }];
    
    
    
//    LJZ_FirstPage_CustomImageView *customimgView = [LJZ_FirstPage_CustomImageView new];
//    customimgView.spaceHeight = 20;
//    [self.view addSubview:customimgView];
//    [customimgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(200);
//        make.top.mas_equalTo(200);
//        make.width.mas_equalTo(customimgView.spaceWith*3 + (customimgView.spaceHeight*3 + customimgView.firstBtnSize) + 0);
//        make.height.mas_equalTo((3*customimgView.spaceHeight + customimgView.firstBtnSize) + 0);
//    }];
    

    _logoImgBtn = [UIButton new];
    [_logoImgBtn setTitle:@"选择按钮" forState:UIControlStateNormal];
    _logoImgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_logoImgBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _logoImgBtn.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:_logoImgBtn];
    [_logoImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_centerX).offset(-20);
        make.top.mas_equalTo(v.mas_bottom);
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
