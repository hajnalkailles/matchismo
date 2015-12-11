//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 08/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                for (UIColor *color in [SetCard validColors]) {
                    for (NSString *shading in [SetCard validShading]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.symbol = symbol;
                        card.number = number;
                        card.color = color;
                        card.shading = shading;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}


@end
