//
//  DVViewController.m
//  GameOfLifeSpriteKit
//
//  Created by Dmitri Voronianski on 05.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

#import "DVViewController.h"
#import "DVMyScene.h"

@implementation DVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];

    // Configure the view.
    SKView *skView = (SKView *)self.view;
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene *scene = [DVMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeResizeFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    // Control buttons
    UIButton *playButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 70.0f, 38.0f)];
    [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"play-pressed"] forState:UIControlStateHighlighted];
    [playButton addTarget:scene action:@selector(play) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:playButton];
    
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 58.0f, 70.0f, 38.0f)];
    [pauseButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    [pauseButton setImage:[UIImage imageNamed:@"pause-pressed"] forState:UIControlStateHighlighted];
    [pauseButton addTarget:scene action:@selector(pause) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:pauseButton];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
