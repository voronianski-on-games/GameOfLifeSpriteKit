//
//  DVCreature.h
//  GameOfLifeSpriteKit
//
//  Created by Dmitri Voronianski on 06.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DVCreature : SKSpriteNode

@property (nonatomic) BOOL isAlive;
@property (nonatomic) NSInteger livingNeighbours;

- (instancetype)initCreature;

@end
