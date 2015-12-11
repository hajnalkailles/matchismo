//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hegyi Hajnalka on 03/12/15.
//  Copyright © 2015 Hegyi Hajnalka. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    return _game;
}

- (Deck *) createDeck   //abstract
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    NSMutableAttributedString *historyLabel = [[NSMutableAttributedString alloc]
                                               initWithString:@"Last move: "];
    [historyLabel appendAttributedString: self.game.lastMove];
    [self.historyLabel setAttributedText: historyLabel];
}

- (void)updateCardsToMatch  //abstract
{
}

- (IBAction)touchResetButton:(UIButton *)sender
{
    self.game = nil;
    [self updateUI];
    [self updateCardsToMatch];
}

- (NSAttributedString *) titleForCard:(Card *)card  //abstract
{
    return nil;
}

- (UIImage *) backgroundImageForCard:(Card *)card   //abstract
{
    return nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"playingHistory"]) {
        HistoryViewController *destViewController = segue.destinationViewController;
        destViewController.gameHistory = self.game.moveHistory;
    }
}

@end
