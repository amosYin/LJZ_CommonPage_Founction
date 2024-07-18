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
        make.width.mas_equalTo(customimgView.spaceWith*3 + (customimgView.spaceHeight*3 + customimgView.secondBtnSize) + 0);
        make.height.mas_equalTo((3*customimgView.spaceHeight + customimgView.secondBtnSize) + 0);
    }];
    

//    UIButton *logoImgBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-20, customimgView.frame.origin.y + customimgView.frame.size.height, 40, 40)];
    UIButton *logoImgBtn = [UIButton new];
    logoImgBtn.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:logoImgBtn];
    [logoImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_centerX).offset(-20);
        make.top.mas_equalTo(customimgView.mas_bottom);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [logoImgBtn addTarget:self action:@selector(logoClick:) forControlEvents:UIControlEventTouchUpInside];

    
}

// click
- (void)logoClick:(UIButton *)sender{
    
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
