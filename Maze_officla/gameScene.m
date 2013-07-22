//
//  gameScene.m
//  Maze_officla
//
//  Created by Xian Sun on 7/22/13.
//  Copyright (c) 2013 Xian Sun. All rights reserved.
//

#import "gameScene.h"
#import <SpriteKit/SpriteKit.h>



@interface gameScene()
@property BOOL contentCreated;

@end


@implementation gameScene

-(void)didMoveToView:(SKView*)view{
    if(!self.contentCreated){
        [self createSceneContents];
        NSLog(@"create contents....");
        self.contentCreated=YES;
    }
}


-(void)createSceneContents{
    NSLog(@"game scene");
    self.backgroundColor=[SKColor redColor];
    self.scaleMode=SKSceneScaleModeAspectFit;
    [self addChild:[self newGameNode]];
}

-(SKLabelNode *)newGameNode{
    SKLabelNode *helloNode=[SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text=@"Mazin";
    helloNode.fontSize=40;
    helloNode.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-50);
    return helloNode;
}


@end
