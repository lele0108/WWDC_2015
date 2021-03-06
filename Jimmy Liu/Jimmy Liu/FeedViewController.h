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
@property (nonatomic, strong) NSArray *data;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showPopUp;

@end
