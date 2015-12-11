//
//  SetCard.h
//  Matchismo
//
//  Created by Hegyi Hajnalka on 08/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "Card.h"
#import <UIKit/UIKit.h>

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *shading;

+ (NSArray *)validSymbols;
+ (NSArray *)validColors;
+ (NSArray *)validShading;
+ (NSUInteger)maxNumber;

@end
