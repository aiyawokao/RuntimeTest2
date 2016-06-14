//
//  ViewController.m
//  RuntimeTest2
//
//  Created by joe on 16/5/9.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(secondVCMethod)];
}

-(id)forwardingTargetForSelector:(SEL)aSelector
{
    Class class = NSClassFromString(@"SecondViewController");
    UIViewController *vc = class.new;
    if (aSelector == NSSelectorFromString(@"secondVCMethod")) {
        NSLog(@"secondVC do this");
        return vc;
    }
    return nil;
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    return [super resolveInstanceMethod:sel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
