//
//  LJZ_FirstPage_CustomRefreshImageView.h
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/19.
//

#import <UIKit/UIKit.h>
#import "LJZ_FirstPage_CustomImageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LJZ_FirstPage_CustomRefreshImageView : UIView
@property(nonatomic,assign)CGFloat firstBtnSize;
@property(nonatomic,assign)CGFloat spaceWith;
@property(nonatomic,assign)CGFloat spaceHeight;

@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,copy)void (^clickBlock)(LJZ_FirstPage_CustomImageModel *mod,NSInteger index);
@end

NS_ASSUME_NONNULL_END
