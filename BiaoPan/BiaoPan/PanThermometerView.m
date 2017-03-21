//
//  PanThermometerView.m
//  BiaoPan
//
//  Created by 劉鵬飛 on 2017/3/1.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "PanThermometerView.h"

@implementation PanThermometerView{

    float thermometerWidth;
    float thermometerHeight;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef content = UIGraphicsGetCurrentContext();

    CGContextAddEllipseInRect(content, CGRectMake(0, 0, thermometerWidth, thermometerHeight));
    CGContextAddEllipseInRect(content, CGRectMake(10, 10, thermometerWidth - 20, thermometerHeight - 20));

    
    [[UIColor greenColor] set];
    CGContextSetLineJoin(content, kCGLineJoinRound);
    CGContextSetLineWidth(content, 1);
    CGContextDrawPath(content, kCGPathStroke);

    
    
    CGContextAddArc(content, thermometerWidth/2, thermometerHeight/2, 45, 90* (M_PI / 180), _angle * (M_PI / 180), 0);
    
    [[UIColor redColor] set];
    CGContextSetLineWidth(content, 10);
    CGContextDrawPath(content, kCGPathStroke);
}

-(void)setNeedsDisplay{

    [super setNeedsDisplay];

}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        thermometerWidth = self.frame.size.width;
        thermometerHeight = self.frame.size.height;
        self.backgroundColor = [UIColor clearColor];
        _angle = 90.0;
    }
    return self;
}

@end
