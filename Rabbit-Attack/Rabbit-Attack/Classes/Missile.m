//
//  MyCocos2DClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Missile.h"
#import "CCAction.h"


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
            
        default:
            break;
    }
    
    
}

-(void) move:(float)yPostion {
    CCActionMoveTo *actionMove = [CCActionMoveTo actionWithDuration:3.0f position:ccp(500,yPostion)];
    [self runAction:actionMove];
}
@end
