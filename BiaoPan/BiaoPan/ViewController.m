//
//  ViewController.m
//  BiaoPan
//
//  Created by 劉鵬飛 on 2017/3/1.
//  Copyright © 2017年 劉鵬飛. All rights reserved.
//

#import "ViewController.h"
#import "PanThermometerView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){

    UIImageView *imageView;
    PanThermometerView *thermoeterView;
    CGPoint beginPoint;
    float xuanZhuanJiaoDu;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float controllWidth = self.view.frame.size.width;
    float controllHegiht = self.view.frame.size.height;
    
    CATransform3D transForm =  CATransform3DMakeRotation(45 * M_PI/180.0, 1, 0, 0);

    imageView = [[UIImageView alloc] initWithFrame:CGRectMake((controllWidth - 200)/2, (controllHegiht - 200)/2, 200, 200)];
    [imageView setImage:[UIImage imageNamed:@"biaoPan"]];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    thermoeterView = [[PanThermometerView alloc] initWithFrame:CGRectMake((controllWidth - 100)/2, (controllHegiht - 100)/2, 100, 100)];
    [self.view addSubview:thermoeterView];
    self.view.layer.transform = transForm;
    
    xuanZhuanJiaoDu = 0.0;
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    beginPoint = [touch locationInView:self.view];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    float moveFloat = beginPoint.x - point.x;
    
    
    if ( (((int)ceil(moveFloat)) % 2) != 0) {
        
        return;
    }
    
    if ((xuanZhuanJiaoDu >= 360) || (xuanZhuanJiaoDu <= -360)) {
        xuanZhuanJiaoDu = 0.0;
    }
    
    if (moveFloat > 0) {
        

        xuanZhuanJiaoDu-=4;
        thermoeterView.angle-=1;

    }else if (moveFloat < 0){

        xuanZhuanJiaoDu+=4;
        thermoeterView.angle+=1;

    }
    
    [thermoeterView setNeedsDisplay];

    CGAffineTransform transform = CGAffineTransformMakeRotation(xuanZhuanJiaoDu * M_PI/180.0);
    [imageView setTransform:transform];
    
    beginPoint = point;
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
