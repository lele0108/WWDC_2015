//
//  PopUpView.m
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/22/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import "PopUpView.h"
#import "KLCPopup.h"

@implementation PopUpView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)goAway:(id)sender {
    NSLog(@"hello");
    [self dismissPresentingPopup];
}

@end
