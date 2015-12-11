//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger cardsToMatch;   //gameplay mode
@property (nonatomic, strong) NSMutableAttributedString* lastMove;
@property (nonatomic, strong) NSMutableAttributedString* moveHistory;

@end
