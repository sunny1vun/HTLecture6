//
//  ViewController.m
//  HTLecture6
//
//  Created by Владислав Сидоренко on 2/2/16.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

+(void)switcher:(int)someCase view:(UIView*)someView;

@property (nonatomic, weak) UIView *movedView;

@end

@implementation ViewController

+(void)switcher:(int)someCase view:(UIView*)someView{
    switch (someCase) {
        case 1:
            someView.backgroundColor = [[UIColor alloc] initWithRed:32/255.f green:87/255.f blue:110/255.f alpha:1];
            
            break;
            
        case 2:
            someView.backgroundColor = [[UIColor alloc] initWithRed:70/255.f green:154/255.f blue:184/255.f alpha:1];
            break;
            
        case 3:
            someView.backgroundColor = [[UIColor alloc] initWithRed:109/255.f green:179/255.f blue:191/255.f alpha:1];
            break;
            
        case 4:
            someView.backgroundColor = [[UIColor alloc] initWithRed:149/255.f green:207/255.f blue:202/255.f alpha:1];
            break;
            
        case 5:
            someView.backgroundColor = [[UIColor alloc] initWithRed:207/255.f green:233/255.f blue:244/255.f alpha:1];
            break;
            
        case 6:
            someView.backgroundColor = [[UIColor alloc] initWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1];
            break;
            
            
        default:
            break;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor= [[UIColor alloc] initWithRed:24/255.f green:54/255.f blue:66/255.f alpha:1];
    
    NSMutableArray *arrayOfViews= [[NSMutableArray alloc] init];
    
    UIView *someView;
    CGFloat myX= 2.f;
    
    for (int i= 0; i< 39; i++) {
    //В качестве аргумента типа CGFloat нужно указывать число в поинтах, с расширением .f
        someView= [[UIView alloc] initWithFrame: CGRectMake(myX, 98.5f, 15.f, 90.f)];
        someView.layer.cornerRadius= 3.f;
        [arrayOfViews addObject: someView];
        if (i<= 1 || 37<= i) {
            
            [ViewController switcher:1 view:someView];
        }
        
        if ( (2<= i && i<= 5)|| (33<= i && i<= 36)) {
            
            [ViewController switcher:2 view:someView];
        }
        
        if ( (6<= i && i<= 9) || (29<= i && i<= 32)) {
            
            [ViewController switcher:3 view:someView];
        }
        
        if ( (10<= i && i<= 13) || (25<= i && i<= 28)) {
            
            [ViewController switcher:4 view:someView];
        }
        
        if ( (14<= i && i<= 17) || (21<= i && i<= 24)) {
            
            [ViewController switcher:5 view:someView];
        }
        
        if ( (18<= i && i<= 20)) {
            
            [ViewController switcher:6 view:someView];
        }
        
        [self.view addSubview:someView];
        
        myX+= 17.5f;
    
    }
    
    UIView *line= [[UIView alloc] initWithFrame: CGRectMake(0.f, 191.f, myX+2.f, 1.f)];
    line.backgroundColor = [[UIColor alloc] initWithRed:84/255.f green:113/255.f blue:125/255.f alpha:1];
    
    [self.view addSubview:line];
    
    arrayOfViews= [[NSMutableArray alloc] init];
    myX= 2.f;
    
    for (int i= 0; i< 39; i++) {
        //В качестве аргумента типа CGFloat нужно указывать число в поинтах, с расширением .f
        someView= [[UIView alloc] initWithFrame: CGRectMake(myX, 194.5f, 15.f, 90.f)];
        someView.layer.cornerRadius= 3.f;
        [arrayOfViews addObject: someView];
        if (i<= 1 || 37<= i) {
            
            [ViewController switcher:1 view:someView];
        }
        
        if ( (2<= i && i<= 5)|| (33<= i && i<= 36)) {
            
            [ViewController switcher:2 view:someView];
        }
        
        if ( (6<= i && i<= 9) || (29<= i && i<= 32)) {
            
            [ViewController switcher:3 view:someView];
        }
        
        if ( (10<= i && i<= 13) || (25<= i && i<= 28)) {
            
            [ViewController switcher:4 view:someView];
        }
        
        if ( (14<= i && i<= 17) || (21<= i && i<= 24)) {
            
            [ViewController switcher:5 view:someView];
        }
        
        if ( (18<= i && i<= 20)) {
            
            [ViewController switcher:6 view:someView];
        }
        
        [self.view addSubview:someView];
        
        myX+= 17.5f;
        
    }
    
    
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)moveWithTouch:(UITouch*)touch {
    CGPoint position= [touch locationInView: touch.view];
    CGPoint previousPosition= [touch previousLocationInView:touch.view];
    
    CGRect frame= touch.view.frame;
    frame.origin.x-= (previousPosition.x- position.x);
    frame.origin.y-= (previousPosition.y- position.y);
    touch.view.frame= frame;
    
    [UIView beginAnimations:@"someAnimation" context:nil];
    [UIView setAnimationDuration:0.3f];
    //обращаемся к вью, к перемещаемому вью, центр вью перенести к position а position это координаты вью объявленного тача тача строчка 163
    self.movedView.center= position;
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    [self moveWithTouch:touch];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    [self moveWithTouch:touch];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    [self moveWithTouch:touch];
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    [self moveWithTouch:touch];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
