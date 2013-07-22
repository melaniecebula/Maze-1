//
//  XASViewController.m
//  Maze_officla
//
//  Created by Xian Sun on 7/22/13.
//  Copyright (c) 2013 Xian Sun. All rights reserved.
//

#import "XASViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "gameScene.h"
@interface XASViewController ()

@end

@implementation XASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view did load");
	SKView *spriteView=(SKView *)self.view;
    spriteView.showsDrawCount=YES;
    spriteView.showsNodeCount=YES;
    spriteView.showsFPS=YES;
}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"view will appear");
    gameScene* hello=[[gameScene alloc]
                      initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView=(SKView*)self.view;
    [spriteView presentScene:hello];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
