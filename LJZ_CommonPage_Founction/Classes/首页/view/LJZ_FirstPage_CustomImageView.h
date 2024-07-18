//
//  LJZ_FirstPage_CustomImageView.h
//  LJZ_CommonPage_Founction
//
//  Created by yinxiangyu on 2024/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJZ_FirstPage_CustomImageView : UIView
/**
    以下属性用于扩展
 */
@property(nonatomic,assign)CGPoint start;
@property(nonatomic,assign)CGFloat firstBtnSize;
@property(nonatomic,assign)CGFloat secondBtnSize;
@property(nonatomic,assign)CGFloat spaceWith;
@property(nonatomic,assign)CGFloat spaceHeight;

@end

NS_ASSUME_NONNULL_END
