//
//  gameScene.m
//  Maze_officla
//
//  Created by Xian Sun on 7/22/13.
//  Copyright (c) 2013 Xian Sun. All rights reserved.
//

#import "gameScene.h"
#import <SpriteKit/SpriteKit.h>
#import "Player.h"


@interface gameScene()
@property BOOL contentCreated;
@property NSMutableArray *boundsArray;
@property SKNode *player;

@end


@implementation gameScene

-(void)didMoveToView:(SKView*)view{
    if(!self.contentCreated){
        [self createSceneContents];
        NSLog(@"create contents....");
        
        [self createPlayer];
     
        self.contentCreated=YES;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    [super touchesBegan:touches withEvent:event];
    
    for (UITouch *t in touches){
        CGPoint controlCenter = _player.position;
        CGPoint touchLocation = [t locationInNode:self];
        
        [_player.physicsBody applyForce:CGPointMake(controlCenter.x - touchLocation.x, controlCenter.y - touchLocation.y)];
        NSLog(@"movin");
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesMoved:touches withEvent:event];
    
    for (UITouch *t in touches) {
        SKAction *action = [SKAction moveTo:[t locationInNode:self] duration:0];
        [_player runAction:action];
    }

    
}



-(SKNode* )createPlayer{
   _player=[[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(25, 25)];
    _player.position=CGPointMake(300, 500);
    _player.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 25)];
    _player.physicsBody.dynamic=YES;
    _player.physicsBody.usesPreciseCollisionDetection = YES;
    _player.physicsBody.mass=0.1;
    [self addChild:_player];
    
    return _player;
}
-(void)createSceneContents{
    NSLog(@"game scene");
    self.backgroundColor=[SKColor redColor];
    self.scaleMode=SKSceneScaleModeAspectFit;
    [self addChild:[self newGameNode]];
    [self createMaze];
    
    
   // [self addChild:[self createMaze]];
}



-(SKLabelNode *)newGameNode{
    SKLabelNode *helloNode=[SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text=@"Mazin";
    helloNode.fontSize=40;
    helloNode.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-50);
    return helloNode;
}



-(SKNode *) createMaze{
    _boundsArray=[[NSMutableArray alloc]init];
    SKSpriteNode *rect1=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor]size:CGSizeMake(25, 925)];
    rect1.position=CGPointMake(50, 500);
    
    //rect1.physicsBody
    rect1.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 925)];
    
    rect1.physicsBody.usesPreciseCollisionDetection=YES;
    rect1.physicsBody.dynamic=NO;
    //rect1.physicsBody.categoryBitMask = APAColliderTypeWall;
    [_boundsArray addObject:rect1];
    [self addChild:rect1];
    
    
    SKSpriteNode *rect2=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(600,25)];
    rect2.position=CGPointMake(350, 950);
    rect2.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(600, 25)];
        rect2.physicsBody.usesPreciseCollisionDetection=YES;
    rect2.physicsBody.dynamic=NO;

    [_boundsArray addObject:rect2];
    [self addChild:rect2];
    
    SKSpriteNode *rect3=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor]size:CGSizeMake(25, 900)];
    rect3.position=CGPointMake(650, 512.5);
   
    rect3.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 900)];
    rect3.physicsBody.usesPreciseCollisionDetection=YES;
     rect3.physicsBody.dynamic=NO;
   [_boundsArray addObject:rect3];
    [self addChild:rect3];
    
    
    SKSpriteNode *rect4=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(500,25)];
    rect4.position=CGPointMake(400, 75);
         rect4.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(500,25)];
    rect4.physicsBody.usesPreciseCollisionDetection=YES;
    rect4.physicsBody.dynamic=NO;

    [_boundsArray addObject:rect4];
    [self addChild:rect4];
    
    
    SKNode *rect5=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor]size:CGSizeMake(30,700)];
    rect5.position=CGPointMake(rect4.position.x-250, rect4.position.y+350-12.5);
    rect5.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(30, 700)];
   
    rect5.physicsBody.usesPreciseCollisionDetection=YES;
     rect5.physicsBody.dynamic=NO;
    [_boundsArray addObject:rect5];
    [self addChild:rect5];
    
    
    SKNode *rect6=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(400, 25)];
    rect6.position=CGPointMake(rect5.position.x+200, rect5.position.y+337.5);
   
    rect6.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(400, 25)];
    rect6.physicsBody.usesPreciseCollisionDetection=YES;
     rect6.physicsBody.dynamic=NO;
    [_boundsArray addObject:rect6];
    [self addChild:rect6];
    
    
    SKNode *rect7=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(25, 500)];
    rect7.position=CGPointMake(rect6.position.x+200, rect6.position.y-250+12.5);
    
    rect7.physicsBody.usesPreciseCollisionDetection=YES;
    rect7.physicsBody.dynamic=NO;
    [_boundsArray addObject:rect7];
    [self addChild:rect7];
    
    
    SKNode *rect8=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(200, 25)];
    rect8.position=CGPointMake(rect7.position.x-100, rect7.position.y-250+12.5);
    
    rect8.physicsBody.usesPreciseCollisionDetection=YES;
    rect8.physicsBody.dynamic=NO;
    [_boundsArray addObject:rect8];
    [self addChild:rect8];
    
    SKNode *rect9=[[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(25, 200)];
    rect9.position=CGPointMake(rect8.position.x-100, rect8.position.y+75+12.5);
    rect9.physicsBody.usesPreciseCollisionDetection=YES;
    rect9.physicsBody.dynamic=NO;
    [_boundsArray addObject:rect9];
    [self addChild:rect9];
    return rect5;
    
  
    
}

-(void)setPlayerPosition:(CGFloat)x y:(CGFloat )y{
    _player.position=CGPointMake(x, y);
    
}


@end
