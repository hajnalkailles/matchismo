//
//  PlayingCard.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "PlayingCard.h"
#import <UIKit/UIKit.h>

@implementation PlayingCard

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {  //2-card match mode
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            } else if (self.rank == otherCard.rank) {
                score = 4;
            }
        }
    } else {    //3-card match mode, was part of assignment #2
        int suitMatch = 0;
        for (int i = 0; i < [otherCards count]; i++) {
            for (int j = 1; j < [otherCards count]; j++) {
                PlayingCard *tempCard1 = [otherCards objectAtIndex:i];
                PlayingCard *tempCard2 = [otherCards objectAtIndex:j];
                if ([tempCard1.suit isEqualToString:tempCard2.suit]) {
                    suitMatch++;
                }
            }
        }
        for (PlayingCard *otherCard in otherCards)
        {
            if ([self.suit isEqualToString:otherCard.suit]) {
                suitMatch++;
            }
        }
        if (suitMatch > 1) {
            score = suitMatch;
        } else {
            int rankMatch = 0;
            for (int i = 0; i < [otherCards count]; i++) {
                for (int j = 1; j < [otherCards count]; j++) {
                    PlayingCard *tempCard1 = [otherCards objectAtIndex:i];
                    PlayingCard *tempCard2 = [otherCards objectAtIndex:j];
                    if (tempCard1.rank == tempCard2.rank) {
                        rankMatch++;
                    }
                }
            }
            for (PlayingCard *otherCard in otherCards)
            {
                if (self.rank == otherCard.rank) {
                    rankMatch++;
                }
            }
            if (rankMatch > 1) {
                score = rankMatch*4;
            }
        }
    }
    
    return score;
}

- (NSAttributedString *)attributedContents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", rankStrings[self.rank], self.suit] attributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}
-(void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
