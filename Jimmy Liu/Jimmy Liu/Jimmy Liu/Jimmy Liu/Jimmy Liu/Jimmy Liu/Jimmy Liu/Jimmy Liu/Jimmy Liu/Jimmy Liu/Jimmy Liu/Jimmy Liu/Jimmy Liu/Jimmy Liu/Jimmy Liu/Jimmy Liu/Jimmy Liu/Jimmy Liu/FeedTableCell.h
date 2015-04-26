//
//  FeedTableCell.h
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleText;
@property (strong, nonatomic) IBOutlet UILabel *despText;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;

@end
