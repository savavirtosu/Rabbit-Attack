//
//  EnemyClass.m
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import "Enemy.h"
#import "CCAction.h"


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
    
    self->enemyType = type;
    
    self.scale = 0.125;
    self.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, self.contentSize} cornerRadius:0]; // 1
    self.physicsBody.collisionGroup = @"enemyGroup"; // 2
    
    return self;
}

-(void) animate {
    switch (enemyType) {
        case EnemyTypeMeteor:
            //            self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"astro.png"];
            [self runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
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

@end
