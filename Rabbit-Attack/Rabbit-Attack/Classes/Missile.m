//
//  MyCocos2DClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Missile.h"
#import "CCAction.h"
#import "CCAnimation.h"


@implementation Missile

-(id) initWithType:(MissileType)type {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"missiles.plist"];
    
    
    switch (type) {
        case MissileTypeOne:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            self = (Missile *) [super initWithImageNamed:@"missile1.png"];
            break;
        case MissileTypeTwo:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            self = (Missile *) [super initWithImageNamed:@"missile2.png"];
            break;
        case MissileTypeThree:
            self = (Missile *) [super initWithImageNamed:@"missile3.png"];
            
            break;
        default:
            break;
    }
    self->missileType = type;
    self.scale = 0.125;
    
    self.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, self.contentSize} cornerRadius:0]; // 1
    self.physicsBody.collisionGroup = @"enemyGroup"; // 2
    
    return self;
}

-(void) animate {
    switch (missileType) {
        case MissileTypeOne:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
//            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
            break;
        case MissileTypeTwo:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
//            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
            break;
        case MissileTypeThree:
        {
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            //            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"main_hero.plist"];
            
            //The sprite animation
            NSMutableArray *flyAnimFrames = [NSMutableArray array];
            for(int i = 3; i <= 5; ++i)
            {
                [flyAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"missile%d.png", i]]];
            }
            CCAnimation *missileAnim = [CCAnimation animationWithSpriteFrames:flyAnimFrames delay:0.2f]; //Speed in which the frames will go at
            
            //Repeating the sprite animation
            CCActionAnimate *animationAction = [CCActionAnimate actionWithAnimation:missileAnim];
            CCActionRepeatForever *repeatingAnimation = [CCActionRepeatForever actionWithAction:animationAction];
            
            //Animation continuously repeating
            [self runAction:repeatingAnimation];
        }
            break;
            
        default:
            break;
    }
    
    
}

-(void) move:(float)yPostion {
    CCActionMoveTo *actionMove = [CCActionMoveTo actionWithDuration:3.0f position:ccp(500,yPostion)];
    [self runAction:actionMove];
}
@end
