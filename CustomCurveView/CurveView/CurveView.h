//
//  CurveView.h
//  CustomCurveView
//
//  Created by Avinash Kashyap on 2/3/17.
//  Copyright © 2017 Headerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
@interface CurveView : UIView
{
    CGFloat radius;
    CGPoint centerPoint;
    CGFloat curveTopMargin;
}
-(instancetype) initWithFrame:(CGRect)frame withUpperCurveMargin:(CGFloat)topMargin;
-(void) updateWithFrame:(CGRect)frame;
-(void) updateCurveMargin:(CGFloat)topMargin;
-(void) updateWithFrame:(CGRect)frame andCurveMargin:(CGFloat)topMargin;
@end
