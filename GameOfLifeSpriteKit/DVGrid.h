//
//  DVGrid.h
//  GameOfLifeSpriteKit
//
//  Created by Dmitri Voronianski on 06.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DVGrid : SKSpriteNode

@property (nonatomic) NSInteger totalAlive;
@property (nonatomic) NSInteger generation;

- (instancetype)initGrid;
- (void)evolveStep;

@end
