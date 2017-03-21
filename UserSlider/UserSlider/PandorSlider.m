//
//  PandorSlider.m
//  UserSlider
//
//  Created by 劉鵬飛 on 2017/2/28.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "PandorSlider.h"

float pandorSlidrWidth = 0.0;
//float pandorSlidrHeight = 0.0;

CGPoint beginPoint;
int starLine = 0;
@implementation PandorSlider


- (void)setNeedsDisplay{
    
    [super setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef content = UIGraphicsGetCurrentContext();
    
    
    for (int i = starLine; i < pandorSlidrWidth - 36; i += 8) {
        
        
        int starNumber = i - starLine;

        if (starNumber %160 == 0) {
            continue;
        }
        
        
        if (starNumber%80 == 0) {
            
            CGContextMoveToPoint(content, i, 15);
            CGContextAddLineToPoint(content,i, 45);
            
            continue;
            
        }
        
        if (starNumber%40 == 0) {
            
            CGContextMoveToPoint(content, i, 25);
            CGContextAddLineToPoint(content,i, 45);
            continue;
        }
        
        CGContextMoveToPoint(content, i, 35);
        CGContextAddLineToPoint(content,i, 45);
        
    }
    
    [[UIColor whiteColor] set];
    CGContextSetLineWidth(content, 2.0);
    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
    for (int i = starLine; i < pandorSlidrWidth - 36; i += 8) {
        
        int starNumber = i - starLine;
        
        if (starNumber%160 == 0) {
            
            CGContextMoveToPoint(content, i, 15);
            CGContextAddLineToPoint(content,i, 45);
        }
        
    }
    
    [[UIColor redColor] set];
    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
    //----------------
    
    
    for (int i = pandorSlidrWidth - 36; i < pandorSlidrWidth; i ++) {
        
        
        int starNumber = i - starLine;
        
        if (starNumber %80 == 0) {
            continue;
        }
        
        
        if (starNumber%40== 0) {
            
            CGContextMoveToPoint(content, i, 30);
            CGContextAddLineToPoint(content,i, 45);
            
            continue;
            
        }
        
        if (starNumber%20 == 0) {
            
            CGContextMoveToPoint(content, i, 35);
            CGContextAddLineToPoint(content,i, 45);
            continue;
        }
        
        if (starNumber % 4 == 0) {
            CGContextMoveToPoint(content, i, 37.5);
            CGContextAddLineToPoint(content,i, 45);

        }
        

    }
    
    [[UIColor whiteColor] set];
    CGContextSetLineWidth(content, 1.0);
    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
//    numberI = 0;
//    for (int i = pandorSlidrWidth - 36; i < pandorSlidrWidth; i += 4) {
//        
//        int starNumber = i - starLine;
//        
//        if (starNumber%(80/(numberI+1)) == 0) {
//            
//            CGContextMoveToPoint(content, i, 30);
//            CGContextAddLineToPoint(content,i, 45);
//        }
//        numberI++;
//        
//    }
//    
//    [[UIColor redColor] set];
//    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
    
    
    //----------------
    for (int i = 0; i < starLine; i += 8) {
        
        int starNumber = pandorSlidrWidth - starLine + i;

        
        if (starNumber %160 == 0) {
            continue;
        }
        
        
        if (starNumber%80 == 0) {
            
            CGContextMoveToPoint(content, i, 15);
            CGContextAddLineToPoint(content,i, 45);
            
            continue;
            
        }
        
        if (starNumber%40 == 0) {
            
            CGContextMoveToPoint(content, i, 25);
            CGContextAddLineToPoint(content,i, 45);
            continue;
        }
        
        CGContextMoveToPoint(content, i, 35);
        CGContextAddLineToPoint(content,i, 45);
        
    }
    
    [[UIColor whiteColor] set];
    CGContextSetLineWidth(content, 2.0);
    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
    for (int i = 0; i < starLine; i += 8) {
        
        int starNumber = pandorSlidrWidth - starLine + i;
        
        if (starNumber%160 == 0) {
            
            CGContextMoveToPoint(content, i, 15);
            CGContextAddLineToPoint(content,i, 45);
        }
        
    }
    
    [[UIColor redColor] set];
    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
    
    
    //----------------
//
//    for (int i = 0; i < 40; i += 4) {
//        
//        int starNumber = pandorSlidrWidth - starLine + i;
//        
//        
//        if (starNumber %64 == 0) {
//            continue;
//        }
//        
//        
//        if (starNumber%32 == 0) {
//            
//            CGContextMoveToPoint(content, i, 30);
//            CGContextAddLineToPoint(content,i, 45);
//            
//            continue;
//            
//        }
//        
//        if (starNumber%16 == 0) {
//            
//            CGContextMoveToPoint(content, i, 35);
//            CGContextAddLineToPoint(content,i, 45);
//            continue;
//        }
//        
//        if (starNumber%8 == 0) {
//            CGContextMoveToPoint(content, i, 40);
//            CGContextAddLineToPoint(content,i, 45);
//        }
//        
//    }
//    
//    [[UIColor whiteColor] set];
//    CGContextSetLineWidth(content, 1.0);
//    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码
//    
//    for (int i = 0; i < 40; i += 4) {
//        
//        int starNumber = pandorSlidrWidth - starLine + i;
//        
//        if (starNumber%64 == 0) {
//            
//            CGContextMoveToPoint(content, i, 30);
//            CGContextAddLineToPoint(content,i, 45);
//        }
//        
//    }
//    
//    [[UIColor redColor] set];
//    CGContextDrawPath(content, kCGPathStroke);//一定要有此句代码

    
}





- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        pandorSlidrWidth = frame.size.width;
        [self setNeedsDisplay];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    beginPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    float moveFloat = beginPoint.x - point.x;
    
    if ( (((int)ceil(moveFloat)) % 2) != 0) {
        
        return;
    }
    
    if (moveFloat < 0) {
        
        starLine += 8;
    }else if (moveFloat > 0){
        
        starLine -= 8;
    }
    beginPoint = point;
    
    if (abs(starLine) > (int)fabsf(pandorSlidrWidth)) {
        starLine = 0;
    }

    
    
    NSLog(@"-----starLine----   %d",starLine);
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}



@end
