//
//  RPLayoutMarginsSpec.m
//  RPVerticalFlowScrollView
//
//  Created by Roman Petryshen on 30/06/15.
//  Copyright (c) 2015 Roman Petryshen. All rights reserved.
//

#import <Holarchy/Holarchy.h>
#import "Helpers.h"
#import <Holarchy/HOLFlowBuilder+PrivateHeader.h>

@interface HOLVerticalFlowBuilder (RPLayoutMarginsSpec)
@property (nonatomic, strong) NSArray *views;
@property (nonatomic, strong) UIView *container;
@end

SpecBegin(RPLayoutMarginsSpec)

    describe(@"Layout", ^{

        CGSize defaultRootViewSize = CGSizeMake(300, 200);

        it(@"should update margin constraint and view size", ^{
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowBuilder *flowScrollView = createFlowViewOnView(rootView);

            int margin = 50;

            flowScrollView.addView(@100).withLeftMargin(margin);
            [flowScrollView.rootView layoutIfNeeded];
            CGRect frame = [(UIView *) flowScrollView.views.lastObject frame];

            expect(frame.size.height).to.equal(100);
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin);
            expect(frame.origin.x).to.equal(margin);


            flowScrollView.withLeftMargin(0);
            [flowScrollView.rootView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width);
            expect(frame.origin.x).to.equal(0);

            flowScrollView.withRightMargin(margin);
            [flowScrollView.rootView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin);
            expect(frame.origin.x).to.equal(0);

            flowScrollView.withLeftMargin(margin);
            [flowScrollView.rootView layoutIfNeeded];
            frame = [(UIView *) flowScrollView.views.lastObject frame];
            expect(frame.size.width).to.equal(defaultRootViewSize.width - margin - margin);
            expect(frame.origin.x).to.equal(margin);
        });

        it(@"should update top/bottom margin constraint and view size for first view", ^{
            UIView *rootView = createViewFoSize(defaultRootViewSize.width, defaultRootViewSize.height);
            HOLVerticalFlowBuilder *flowScrollView = createFlowViewOnView(rootView);

            int margin = 50;
            int itemHeight = 100;

            UIView *itemView = [UIView new];

            flowScrollView.addView(itemView).withHeight(itemHeight).withTopMargin(margin);
            [flowScrollView.rootView layoutIfNeeded];

            CGRect contentViewFrame = [flowScrollView.contentView frame];
            CGRect itemViewFrame = [itemView frame];

            expect(contentViewFrame.size.height).to.equal(itemHeight + margin);
            expect(itemViewFrame.origin.y).to.equal(margin);

//
//            flowScrollView.withTopMargin(0);
//            [flowScrollView.rootView layoutIfNeeded];
//            frame = [(UIView *) flowScrollView.views.lastObject frame];
//            expect(frame.size.width).to.equal(defaultRootViewSize.height);
//            expect(frame.origin.x).to.equal(0);
//
//            flowScrollView.withBottonMargin(margin);
//            [flowScrollView.rootView layoutIfNeeded];
//            frame = [(UIView *) flowScrollView.views.lastObject frame];
//            expect(frame.size.width).to.equal(defaultRootViewSize.height - margin);
//            expect(frame.origin.x).to.equal(0);
//
//            flowScrollView.withTopMargin(margin);
//            [flowScrollView.rootView layoutIfNeeded];
//            frame = [(UIView *) flowScrollView.views.lastObject frame];
//            expect(frame.size.width).to.equal(defaultRootViewSize.height - margin - margin);
//            expect(frame.origin.x).to.equal(margin);
        });


    });

SpecEnd

