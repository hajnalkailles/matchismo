//
//  Card.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.attributedContents isEqualToAttributedString:self.attributedContents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
