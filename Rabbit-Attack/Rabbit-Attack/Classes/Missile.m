//
//  MyCocos2DClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Missile.h"


@implementation Missile

-(id) initWithType:(MissileType)type {
    
    
    
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
@end
