//
//  EnemyClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

-(id) initWithType:(EnemyType)type {

    self.scale = 0.25;
    
    switch (type) {
        case EnemyTypeMeteor:
            self.spriteFrame = [CCSprite spriteWithImageNamed:@"astro.png"];
            break;
        case EnemyTypeAstro:
            self.spriteFrame = [CCSprite spriteWithImageNamed:@"astro.png"];
            break;
            
        default:
            break;
    }
    return self;
}

@end
