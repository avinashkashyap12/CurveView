//
//  CurveView.m
//  CustomCurveView
//
//  Created by Avinash Kashyap on 2/3/17.
//  Copyright © 2017 Headerlabs. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView

-(instancetype) initWithFrame:(CGRect)frame withUpperCurveMargin:(CGFloat)topMargin{
    self = [super initWithFrame: frame];
    if(self){
        curveTopMargin = topMargin;
        [self calculateRadius];
    }
    return self;
}
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if(self){
        curveTopMargin = 70;
        [self calculateRadius];
    }
    return self;
}
-(void) awakeFromNib{
    [super awakeFromNib];
    curveTopMargin = 70;
    [self calculateRadius];
}
#pragma mark - Update
-(void) updateWithFrame:(CGRect)frame{
    [self updateWithFrame:frame andCurveMargin:curveTopMargin];
}
-(void) updateCurveMargin:(CGFloat)topMargin{
    [self updateWithFrame:self.frame andCurveMargin:curveTopMargin];
}
-(void) updateWithFrame:(CGRect)frame andCurveMargin:(CGFloat)topMargin{
    curveTopMargin = topMargin;
    self.frame = frame;
    [self calculateRadius];
    [self setNeedsDisplay];
}
#pragma mark - Calculate radius and center
-(void) calculateRadius{
    CGFloat a = [self calculateDistance:CGPointMake(0, curveTopMargin) andPoint:CGPointMake(self.frame.size.width/2, 0)];
    CGFloat c = [self calculateDistance:CGPointMake(self.frame.size.width, curveTopMargin) andPoint:CGPointMake(self.frame.size.width/2, 0)];
    radius = (a * c)/(2*curveTopMargin);
    centerPoint = CGPointMake(self.frame.size.width/2, radius);
}
-(CGFloat) calculateDistance:(CGPoint)p1 andPoint:(CGPoint)p2{
    CGFloat x =sqrt((pow((p2.x - p1.x), 2)+(pow(p2.y - p1.y, 2))));
    return x;
}

#pragma mark - Draw
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //-------draw
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    [curvePath addArcWithCenter:centerPoint radius:radius-1  startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    CGPathRef cgPath = CGPathCreateCopy(curvePath.CGPath);
    CGContextAddPath(context, cgPath);
    CGContextSetLineWidth(context, 1);
    CGContextSetShadowWithColor(context, CGSizeMake(0, -1.0), 0.3, [UIColor lightGrayColor].CGColor);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    CGPathRelease(cgPath);
    CGContextRestoreGState(context);
}



@end
