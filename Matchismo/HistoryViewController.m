//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 10/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation HistoryViewController

- (NSMutableAttributedString *) moveHistory
{
    if (!_gameHistory)
        _gameHistory = [[NSMutableAttributedString alloc] initWithString:@"Moves:\n"];
    return _gameHistory;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self updateTextViewWithLastMove];
}

-(void)updateTextViewWithLastMove
{
    [self.historyTextView setAttributedText:self.gameHistory];
}


@end
