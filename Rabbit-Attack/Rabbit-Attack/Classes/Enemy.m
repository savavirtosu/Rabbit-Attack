//
//  EnemyClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Enemy.h"
#import "CCAction.h"
#import "CCAnimation.h"


@implementation Enemy

-(id) initWithType:(EnemyType)type {
    
    
    switch (type) {
        case EnemyTypeMeteor:
//            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"meteor.png"];
            self = (Enemy *) [super initWithImageNamed:@"meteor.png"];
            break;
        case EnemyTypeAstro:
//            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            self = (Enemy *) [super initWithImageNamed:@"astro.png"];
            break;
            
        default:
            break;
    }
    
    self->enemyType = type;
    
    self.scale = 0.125;
    self.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, self.contentSize} cornerRadius:0]; // 1
    self.physicsBody.collisionGroup = @"enemyGroup"; // 2
    self.physicsBody.collisionType = @"enemyCollision"; // 2
    
    return self;
}

-(void) animate {
    switch (enemyType) {
        case EnemyTypeMeteor:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.3 angle:10]]];
            break;
        case EnemyTypeAstro:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
            break;
            
        default:
            break;
    }
}

-(void) move:(float)targetPostion {
    CCActionMoveTo *actionMove = [CCActionMoveTo actionWithDuration:5.0f position:ccp(-100,targetPostion)];
    [self runAction:actionMove];
}

-(void) die {
    switch (enemyType) {
        case EnemyTypeMeteor:
            [self explosionAnimation];
            break;
        case EnemyTypeAstro:
            [self explosionAnimation];
            break;
            
        default:
            break;
    }
}
-(void) explosionAnimation {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"explosion.plist"];
    
    //The sprite animation
    NSMutableArray *flyAnimFrames = [NSMutableArray array];
    for(int i = 1; i <= 8; ++i)
    {
        [flyAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"explosion%d.png", i]]];
    }
    CCAnimation *missileAnim = [CCAnimation animationWithSpriteFrames:flyAnimFrames delay:0.1f]; //Speed in which the frames will go at
    //    C *remove = [CCCallFuncN actionWithTarget:self selector:@selector(removeSprite:)];
    
    //Repeating the sprite animation
    CCActionAnimate *animationAction = [CCActionAnimate actionWithAnimation:missileAnim];
    //    CCActionRepeatForever *repeatingAnimation = [CCActionRepeatForever actionWithAction:animationAction];
    
    //Animation continuously repeating
    //    [self stopAction:actionMove];
    [self runAction:animationAction];
}
@end
