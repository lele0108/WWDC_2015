//
//  TripleImageCell.h
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import <UIKit/UIKit.h>

//reusable: tripleImageCell
@interface TripleImageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageOne;
@property (strong, nonatomic) IBOutlet UIImageView *imageTwo;
@property (strong, nonatomic) IBOutlet UIImageView *imageThree;

@end
