//
//  ViewController.m
//  MediaServer
//
//  Created by rdqa on 2015/2/11.
//  Copyright (c) 2015年 mocacube. All rights reserved.
//

#import "ViewController.h"
#import "MediaServer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MediaServer *server = [[MediaServer alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
