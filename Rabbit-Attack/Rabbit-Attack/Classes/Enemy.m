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

    
    
    switch (type) {
        case EnemyTypeMeteor:
//            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            self = (Enemy *) [super initWithImageNamed:@"astro.png"];
            break;
        case EnemyTypeAstro:
//            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            self = (Enemy *) [super initWithImageNamed:@"astro.png"];
            break;
            
        default:
            break;
    }
    
    self.scale = 0.125;
    
    return self;
}

@end
