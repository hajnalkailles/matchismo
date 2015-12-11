//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "CardMatchingGame.h"
#import "SetCard.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;    //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableAttributedString *) lastMove
{
    if (!_lastMove)
        _lastMove = [[NSMutableAttributedString alloc] init];
    return _lastMove;
}

- (NSMutableAttributedString *) moveHistory
{
    if (!_moveHistory)
        _moveHistory = [[NSMutableAttributedString alloc] initWithString:@"Moves:\n"];
    return _moveHistory;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    [self.lastMove setAttributedString:[[NSAttributedString alloc] initWithString: @""]];
    
    Card *card = [self cardAtIndex:index];
    NSMutableArray *otherCards = [[NSMutableArray alloc] init];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            if ([otherCards count] == self.cardsToMatch-1) {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    [self.lastMove setAttributedString:[[NSAttributedString alloc] initWithString: @"Matched: "]];
                    [self.lastMove appendAttributedString: card.attributedContents];
                    for (Card *card in otherCards) {
                        card.matched = YES;
                        [self.lastMove appendAttributedString:[[NSAttributedString alloc] initWithString: @" "]];
                        [self.lastMove appendAttributedString: card.attributedContents];
                    }
                    [self.lastMove appendAttributedString: [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@" for %d point!", matchScore]]];
                } else {
                    [self.lastMove setAttributedString: [[NSMutableAttributedString alloc] initWithString: @""]];
                    self.score -= MISMATCH_PENALTY;
                    for (Card *card in otherCards) {
                        card.chosen = NO;
                        [self.lastMove appendAttributedString: card.attributedContents];
                        [self.lastMove appendAttributedString:[[NSAttributedString alloc] initWithString: @" "]];
                    }
                    [self.lastMove appendAttributedString: card.attributedContents];
                    [self.lastMove appendAttributedString: [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@" don't match! %d point penalty!", MISMATCH_PENALTY]]];
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            NSAttributedString *emptyString = [[NSMutableAttributedString alloc] initWithString: @""];
            if ([self.lastMove isEqualToAttributedString: emptyString]) {
                self.lastMove = [[NSMutableAttributedString alloc] initWithString: @"Selected: "];
                [self.lastMove appendAttributedString: card.attributedContents];
            }
        }
    }
    [self.moveHistory appendAttributedString:[[NSAttributedString alloc] initWithString: @"\n"]];
    [self.moveHistory appendAttributedString:self.lastMove];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype)init
{
    return nil;
}

@end
