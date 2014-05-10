//
//  HelloWorldScene.h
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright Sava Virtosu 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Importing cocos2d.h and cocos2d-ui.h, will import anything you need to start using Cocos2D v3
#import "cocos2d.h"
#import "cocos2d-ui.h"

// -----------------------------------------------------------------------

/**
 *  The main scene
 */
@interface GameScene : CCScene

// -----------------------------------------------------------------------

+ (GameScene *)scene;
- (id)init;

- (void)backgroundScroll:(CCTime)dt;
- (void)enemySpawner:(CCTime)dt;

// -----------------------------------------------------------------------
@end