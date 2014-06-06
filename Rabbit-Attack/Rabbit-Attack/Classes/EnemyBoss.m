//
//  EnemyBoss.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 17/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "EnemyBoss.h"
#import "CCAnimation.h"


@implementation EnemyBoss

-(id) initWithType:(EnemyBossType)type {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"dstar.plist"];
    
    switch (type) {
        case EnemyBossTypeUnicorn:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"meteor.png"];
            self = (EnemyBoss *) [super initWithImageNamed:@"dstar1.png"];
            break;
        default:
            break;
    }
    
    self->enemyBossType = type;
    
    self.scale = 0.25;
    self.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, self.contentSize} cornerRadius:0]; // 1
    self.physicsBody.collisionGroup = @"bossGroup"; // 2
    self.physicsBody.collisionType = @"bossCollision"; // 2
    
    return self;
}

-(void) animate {
    switch (enemyBossType) {
        case EnemyBossTypeUnicorn:
        {
            //The sprite animation
            NSMutableArray *fly2AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 5; ++i)
            {
                [fly2AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"dstar%d.png", i]]];
            }
            for(int i = 4; i > 1; --i)
            {
                [fly2AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"dstar%d.png", i]]];
            }
            CCAnimation *walk2Anim = [CCAnimation
                                      animationWithSpriteFrames:fly2AnimFrames delay:0.25f]; //Speed in which the frames will go at
            
            //Repeating the sprite animation
            CCActionAnimate *animationAction2 = [CCActionAnimate actionWithAnimation:walk2Anim];
            CCActionRepeatForever *repeatingAnimation2 = [CCActionRepeatForever actionWithAction:animationAction2];
            
            [self runAction:repeatingAnimation2];
        }
            break;
            
        default:
            break;
    }
    
}

-(void) die {
    switch (enemyBossType) {
        case EnemyBossTypeUnicorn:
            [self explosionAnimation];
            break;
            
        default:
            break;
    }
}

@end
