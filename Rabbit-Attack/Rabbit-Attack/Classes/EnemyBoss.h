//
//  EnemyBoss.h
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 17/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"

typedef enum {
    EnemyBossTypeUnicorn = 0
} EnemyBossType;

@interface EnemyBoss : Enemy {
    EnemyBossType enemyBossType;
}

-(id)initWithType:(EnemyBossType)type;
-(void)animate;
-(void)die;

@end
