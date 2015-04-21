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
    
    CGRect newFrame = self.storyCellTable.tableHeaderView.frame;
    newFrame.size.height = newFrame.size.height / 2 + 80;
    self.storyCellTable.tableHeaderView.frame = newFrame;
    [self.storyCellTable setTableHeaderView:self.storyCellTable.tableHeaderView];
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
        cell.paragraphText.text = @"";
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
    } else if (indexPath.row == 3) {
        static NSString *CellIdentifier = @"doubleImageCell";
        DoubleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[DoubleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        UIImage *bgPhoto = [UIImage imageNamed: @"test.jpg"];
        
        cell.imageOne.image = bgPhoto;
        cell.imageTwo.image = bgPhoto;
        return cell;
    } else if (indexPath.row == 4) {
        static NSString *CellIdentifier = @"quoteCell";
        QuoteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[QuoteCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.quoteText.text = @"";
        cell.quoteText.text = @"Once upon a time Steve Jobs said that all men were brilliant";
        return cell;
    } else {
        static NSString *CellIdentifier = @"tripleImageCell";
        TripleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TripleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        UIImage *bgPhoto = [UIImage imageNamed: @"test.jpg"];
        
        cell.imageOne.image = bgPhoto;
        cell.imageTwo.image = bgPhoto;
        cell.imageThree.image = bgPhoto;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
