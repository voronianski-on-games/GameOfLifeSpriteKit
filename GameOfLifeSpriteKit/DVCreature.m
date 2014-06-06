//
//  DVCreature.m
//  GameOfLifeSpriteKit
//
//  Created by Dmitri Voronianski on 06.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

#import "DVCreature.h"

@implementation DVCreature

- (instancetype)initCreature
{
    self = [super initWithImageNamed:@"bubble"];
    
    if (self) {
        self.isAlive = NO;
    }
    
    return self;
}

- (void)setIsAlive:(BOOL)isAlive
{
    _isAlive = isAlive;
    [self setHidden:!_isAlive];
}

@end
