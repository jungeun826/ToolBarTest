//
//  ViewController.m
//  ToolBarTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *valueText;

@end

@implementation ViewController
- (IBAction)processChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _valueText.text = [NSString stringWithFormat:@"Value : %f", slider.value];
}
- (IBAction)handleBarButtonClick:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    
    if(!button.tag){
        NSLog(@"\nLeft 버튼");
    }else{
        NSLog(@"\nRight 버튼");
    }
}

-(void)handleRefresh:(id)sender {
    NSLog(@"Refresh!!");
}

-(void)handleButton:(id)sender {
    NSLog(@"Button Click!!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *thumb =[UIImage imageNamed:@"_Right.png"];
    
    //[self.view.subviews[2] setThumbImage:thumb forState:UIControlStateNormal];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 160, 320, 60)];
    
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc]initWithTitle:@"Button" style:UIBarButtonItemStyleDone target:self action:@selector(handleButton:)];
    
    NSArray *segments = @[@"A",@"B",@"C"];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segments];
    segment.frame  = CGRectMake(0, 0, 140, 44);
    UIBarButtonItem *segmentButton = [[UIBarButtonItem alloc] initWithCustomView:segment];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //space.width = 70;
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(handleRefresh:)];
    
    NSArray *items = @[titleButton,segmentButton, space, refreshButton];
    [toolBar setItems:items];
    [self.view addSubview:toolBar];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
