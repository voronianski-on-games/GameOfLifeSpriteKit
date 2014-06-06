//
//  DVMyScene.m
//  GameOfLifeSpriteKit
//
//  Created by Dmitri Voronianski on 05.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

#import "DVMyScene.h"
#import "DVGrid.h"

@implementation DVMyScene {
    DVGrid *_grid;
    SKAction *_timer;
    SKLabelNode *_generationLabel;
    SKLabelNode *_populationLabel;
    BOOL _isPaused;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        [background setAnchorPoint:CGPointMake(0.0f, 0.0f)];
        [background setPosition:CGPointMake(0.0f, 0.0f)];
        [self addChild:background];
        
        _grid = [[DVGrid alloc] initGrid];
        [_grid setAnchorPoint:CGPointMake(0.0f, 0.0f)];
        [_grid setPosition:CGPointMake(size.height-_grid.size.width-10.0f, 6.0f)];
        [self addChild:_grid];
        
        SKSpriteNode *microscope = [SKSpriteNode spriteNodeWithImageNamed:@"microscope"];
        [microscope setAnchorPoint:CGPointMake(0.0f, 0.0f)];
        [microscope setPosition:CGPointMake(16.0f, 10.0f)];
        [self addChild:microscope];
        
        SKSpriteNode *balloon = [SKSpriteNode spriteNodeWithImageNamed:@"balloon"];
        [balloon setAnchorPoint:CGPointMake(0.5f, 0.0f)];
        [balloon setPosition:CGPointMake(balloon.size.width/2.0f + 3.0f, microscope.size.height + 18.0f)];
        [self addChild:balloon];
        
        UIColor *labelColor = [UIColor colorWithRed:(35/255.0) green:(116/255.0) blue:(53/255.0) alpha:1];
        NSString *fontName = @"Helvetica Neue Bold";
        CGFloat fontSize = 12.0f;
        
        SKLabelNode *generationLabelText = [SKLabelNode labelNodeWithFontNamed:fontName];
        [generationLabelText setText:@"Population"];
        [generationLabelText setFontSize:fontSize];
        [generationLabelText setFontColor:labelColor];
        [generationLabelText setPosition:CGPointMake(2.0f, 65.0f)];
        [balloon addChild:generationLabelText];
        
        _generationLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
        [_generationLabel setText:@"0"];
        [_generationLabel setFontSize:fontSize];
        [_generationLabel setFontColor:labelColor];
        [_generationLabel setPosition:CGPointMake(2.0f, 50.0f)];
        [balloon addChild:_generationLabel];
        
        SKLabelNode *populationLabelText = [SKLabelNode labelNodeWithFontNamed:fontName];
        [populationLabelText setText:@"Generation"];
        [populationLabelText setFontSize:fontSize];
        [populationLabelText setFontColor:labelColor];
        [populationLabelText setPosition:CGPointMake(2.0f, 33.0f)];
        [balloon addChild:populationLabelText];
        
        _populationLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
        [_populationLabel setText:@"0"];
        [_populationLabel setFontSize:fontSize];
        [_populationLabel setFontColor:labelColor];
        [_populationLabel setPosition:CGPointMake(2.0f, 18.0f)];
        [balloon addChild:_populationLabel];
    }
    
    return self;
}

- (void)play
{
    if (_isPaused) {
        _isPaused = NO;
        [self setSpeed:1.0f];
    }
    
    if (_timer) {
        return;
    }
    
    SKAction *wait = [SKAction waitForDuration:0.5f];
    SKAction *performSelector = [SKAction performSelector:@selector(step) onTarget:self];
    SKAction *sequence = [SKAction sequence:@[performSelector, wait]];
    _timer = [SKAction repeatActionForever:sequence];
    [self runAction:_timer];
}

- (void)pause
{
    if (_isPaused) {
        return;
    }
    _isPaused = YES;
    [self setSpeed:0.0f];
}

- (void)step
{
    [_grid evolveStep];
    [_generationLabel setText:[NSString stringWithFormat:@"%d", _grid.generation]];
    [_populationLabel setText:[NSString stringWithFormat:@"%d", _grid.totalAlive]];
}

@end
