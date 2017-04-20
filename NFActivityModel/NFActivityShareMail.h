//
//  NFActivityShareMail.h
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFActivityModelConstants.h"
#import "NFActivityShareMailItem.h"

@interface NFActivityShareMail : UIActivity

- (instancetype)init NS_UNAVAILABLE;

/**
 * Initialize with active UIViewController
 */
- (instancetype)initWithViewController:(UIViewController *)viewController;

@end
