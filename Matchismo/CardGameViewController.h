//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//
// Abstract class.

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardGameViewController : UIViewController

@property (nonatomic, strong) CardMatchingGame *game;

// protected
// for subclasses
- (Deck *)createDeck;   //abstract
- (void)updateUI;

@end

