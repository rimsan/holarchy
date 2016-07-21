//
// Created by Roman Petryshen on 17/06/15.
// Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOLFlowBuilder : NSObject

@property (nonatomic, readonly) UIView *rootView;

@property (nonatomic, readonly) UIView *contentView;

@property (nonatomic, assign) UIEdgeInsets contentViewInsets;

@end