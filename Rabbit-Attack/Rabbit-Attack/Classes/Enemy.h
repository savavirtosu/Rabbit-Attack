//
//  EnemyClass.h
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    EnemyTypeMeteor = 0,
    EnemyTypeAstro = 1
} EnemyType;

@interface Enemy : CCSprite {
    EnemyType enemyType;
}

-(id)initWithType:(EnemyType)type;
-(void)animate;
-(void)move:(float)targetPostion;

@end
