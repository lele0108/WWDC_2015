//
//  StoryViewController.m
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import "StoryViewController.h"
#import "TitleCell.h"
#import "ParagraphCell.h"
#import "QuoteCell.h"
#import "SingleImageCell.h"
#import "DoubleImageCell.h"
#import "TripleImageCell.h"

@interface StoryViewController() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation StoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.storyCellTable.estimatedRowHeight = 44.0;
    self.storyCellTable.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"titleCell";
        TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TitleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.titleText.text = @"1. This is a test title text";
        return cell;
    } else if (indexPath.row == 1) {
        static NSString *CellIdentifier = @"paragraphCell";
        ParagraphCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[ParagraphCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.paragraphText.text = @"In the modern world full of variables that are unique to each person, everybody poccesses two fundamnetal dates: their birth and death. For me, this date lies on the 8th of Janurary. Born in the busy city of Beijing, my parents quickly imigrated to the United States.";
        return cell;
    } else if (indexPath.row == 2) {
        static NSString *CellIdentifier = @"singleImageCell";
        SingleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[SingleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        UIImage *bgPhoto = [UIImage imageNamed: @"test.jpg"];
        
        cell.imageOne.image = bgPhoto;
        return cell;
    } else {
        static NSString *CellIdentifier = @"titleCell";
        TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TitleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.titleText.text = @"1. This is a test title text";
        return cell;
    }
}

@end
