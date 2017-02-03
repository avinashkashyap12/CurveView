//
//  ViewController.m
//  CustomCurveView
//
//  Created by Avinash Kashyap on 2/3/17.
//  Copyright © 2017 Headerlabs. All rights reserved.
//

#import "ViewController.h"
#import "CurveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self performSelector:@selector(addCurveView) withObject:nil afterDelay:0.3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) addCurveView{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CurveView *topCurveView = [[CurveView alloc] initWithFrame:CGRectMake(0, screenSize.height, screenSize.width, 250) withUpperCurveMargin:60];
    topCurveView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:topCurveView];
    CGRect f = topCurveView.frame;
    f.origin.y = screenSize.height - f.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        topCurveView.frame = f;
    }];
}

@end
