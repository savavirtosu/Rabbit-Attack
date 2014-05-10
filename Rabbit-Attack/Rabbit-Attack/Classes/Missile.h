//
//  MyCocos2DClass.h
//  Rabbit-Attack
//
//  Created by Sava Virtosu on 10/05/14.
//  Copyright 2014 Sava Virtosu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    MissileTypeOne = 0,
    MissileTypeTwo = 1,
    MissileTypeThree = 2
} MissileType;

@interface Missile : CCSprite {
    MissileType missileType;
    
}
-(id)initWithType:(MissileType)type;
-(void)animate;
-(void)move:(float)targetPostion;

@end
