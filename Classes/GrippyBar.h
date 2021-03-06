//
//  GrippyBar.h
//  LatestChatty2
//
//  Created by Alex Wayne on 3/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GrippyBarDelegate <NSObject>

- (void)grippyBarDidSwipeUp;
- (void)grippyBarDidSwipeDown;
- (void)grippyBarDidTapLeftButton;
- (void)grippyBarDidTapRightButton;
- (void)grippyBarDidTapRefreshButton;
- (void)grippyBarDidTapTagButton;
- (void)grippyBarDidTapModButton;
- (void)grippyBarDidTapOrderByPostDateButton;

@end


@interface GrippyBar : UIView {
  
  BOOL isDragging;
  BOOL isOrderByPostDate;
  CGPoint initialTouchPoint;
  IBOutlet id<GrippyBarDelegate> delegate;
  UIButton *orderByPostDateButton;
}

- (void)tappedLeftButton;
- (void)tappedRightButton;
- (void)tappedRefreshButton;
- (void)tappedTagButton;
- (void)tappedModButton;
- (void)tappedOrderByPostDateButton;

@end
