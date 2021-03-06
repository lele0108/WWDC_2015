//
//  StoryViewController.h
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URBMediaFocusViewController.h"

@interface StoryViewController : UIViewController <URBMediaFocusViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *storyNumber;
@property (strong, nonatomic) IBOutlet UILabel *storyTitle;
@property (strong, nonatomic) IBOutlet UILabel *storyDate;
@property (strong, nonatomic) IBOutlet UILabel *storyLocation;
@property (strong, nonatomic) IBOutlet UIImageView *storyImage;
@property (strong, nonatomic) IBOutlet UITableView *storyCellTable;
@property (strong, nonatomic) NSDictionary *storyModel;
@property (strong, nonatomic) NSArray *contents;

@end
