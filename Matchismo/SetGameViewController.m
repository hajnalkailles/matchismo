//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 08/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [super updateUI];
    [self updateCardsToMatch];
}

- (void)updateCardsToMatch
{
    self.game.cardsToMatch = 3;
}

- (UIImage *) backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfrontSelected" : @"cardfront"];
}

- (NSAttributedString *) titleForCard:(Card *)card
{
    return card.attributedContents;
}

@end
