//
//  FeedViewController.h
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *feedTableView;

@property (nonatomic, strong) NSArray *story;
@property (nonatomic, strong) NSArray *desp;
@property (nonatomic, strong) NSArray *images;

@end
