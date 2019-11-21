//
//  MCCouponTagLabel.h
//  DrawTriangle
//
//  Created by xibHe on 2019/11/20.
//  Copyright © 2019 Peng he. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 左右两边内嵌
@interface MCCouponTagLabel : UILabel
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text textColor:(NSString *)textColor backgroundColor:(NSString *)backgroundColor cornerRadius:(NSInteger)cornerRadius;
@end

NS_ASSUME_NONNULL_END
