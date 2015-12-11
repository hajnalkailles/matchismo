//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 08/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self updateCardsToMatch];
}

- (void)updateCardsToMatch
{
    self.game.cardsToMatch = 2;
}

- (UIImage *) backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSAttributedString *) titleForCard:(Card *)card
{
    if (card.isChosen) {
        return card.attributedContents;
    } else {
        return [[NSAttributedString alloc] initWithString:@""];
    }
}

@end
