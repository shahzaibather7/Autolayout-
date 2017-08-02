//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

//@property (nonatomic , weak) UIView *newView;


@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.backgroundColor = [UIColor purpleColor];
    purpleBox.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.framingView addSubview:purpleBox];

//AUTOLAYOUT FOR PURPLE BOX
    
       NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTrailing multiplier: 1.0 constant:-20];
       NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeBottom multiplier: 1.0 constant:-20];
       NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeWidth multiplier: 300.0/500.0 constant: 1];
       NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    
    
    rightConstraint.active = YES;
    bottomConstraint.active = YES;
    widthConstraint.active = YES;
    heightConstraint.active = YES;

    
//AUTOLAYOUT FOR RED BOX
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.backgroundColor = [UIColor redColor];
    redBox.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.framingView addSubview:redBox];

    
    NSLayoutConstraint *rightConstraintRed = [NSLayoutConstraint constraintWithItem:redBox
                                                                            attribute:NSLayoutAttributeTrailing
                                                                            relatedBy:NSLayoutRelationEqual toItem:framingView
                                                                            attribute:NSLayoutAttributeTrailing
                                                                           multiplier: 1.0
                                                                             constant:-20];
    
    NSLayoutConstraint *topConstraintRed = [NSLayoutConstraint constraintWithItem:redBox
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:framingView
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier: 1.0
                                                                           constant:20];
    
    NSLayoutConstraint *widthConstraintRed = [NSLayoutConstraint constraintWithItem:redBox
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:100.0];
    
    NSLayoutConstraint *heightConstraintRed = [NSLayoutConstraint constraintWithItem:redBox
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1.0
                                                                              constant:30];
    
    topConstraintRed.active = YES;
    widthConstraintRed.active = YES;
    heightConstraintRed.active = YES;
    rightConstraintRed.active = YES;


//AUTOLAYOUT FOR ORANGE BOX 1
    
    UIView *orangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1.backgroundColor = [UIColor orangeColor];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = false;
    [redBox addSubview:orangeBox1];
    
    NSLayoutConstraint *rightConstraintOrange1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                              attribute:NSLayoutAttributeTrailing
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:redBox
                                                                              attribute:NSLayoutAttributeTrailing
                                                                             multiplier:1.0
                                                                               constant:-5];
    
    NSLayoutConstraint *bottomConstraintOrange1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:redBox
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1.0
                                                                                constant:-5];
    
    NSLayoutConstraint *topConstraintOrange1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:redBox
                                                                            attribute:NSLayoutAttributeTop
                                                                           multiplier:1.0
                                                                             constant:5];
    NSLayoutConstraint *leftConstraintOrange1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                            attribute:NSLayoutAttributeLeft
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:redBox
                                                                            attribute:NSLayoutAttributeLeft
                                                                           multiplier:1.0
                                                                             constant:65];
    leftConstraintOrange1.active = true;
    topConstraintOrange1.active = true;
    rightConstraintOrange1.active = true;
    bottomConstraintOrange1.active = true;
    
// AUTOLAYOUT FOR ORANGE BOX 2
    
    UIView *orangeBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2.backgroundColor = [UIColor orangeColor];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = false;
    [redBox addSubview:orangeBox2];
    
    NSLayoutConstraint *rightConstraintOrange2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                              attribute:NSLayoutAttributeTrailing
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:redBox
                                                                              attribute:NSLayoutAttributeTrailing
                                                                             multiplier:1.0
                                                                               constant:-40];
    
    NSLayoutConstraint *bottomConstraintOrange2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:redBox
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1.0
                                                                                constant:-5];
    
    NSLayoutConstraint *topConstraintOrange2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:redBox
                                                                            attribute:NSLayoutAttributeTop
                                                                           multiplier:1.0
                                                                             constant:5];
    NSLayoutConstraint *leftConstraintOrange2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:redBox
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:5];
    
    
    
    leftConstraintOrange2.active = true;
    topConstraintOrange2.active = true;
    rightConstraintOrange2.active = true;
    bottomConstraintOrange2.active = true;

    
    
 //AUTO LAYOUT FOR  BOX 1
    UIView *middlebox = [[UIView alloc] initWithFrame:CGRectZero];
    middlebox.backgroundColor = [UIColor blueColor];
    middlebox.translatesAutoresizingMaskIntoConstraints = false;
    [framingView addSubview:middlebox];
    
    NSLayoutConstraint *middleBoxConstraint = [NSLayoutConstraint constraintWithItem:middlebox
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:framingView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier: 1.0
                                                                            constant:0];
    NSLayoutConstraint *middleBoxConstraint2 = [NSLayoutConstraint constraintWithItem:middlebox
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:framingView
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier: 1.0
                                                                            constant:0];

    
    
    
    
    
    NSLayoutConstraint *widthmiddleBoxConstraint = [NSLayoutConstraint constraintWithItem:middlebox
                                                                                attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 0
                                                                                 constant:40];
    NSLayoutConstraint *heightmiddleBoxConstraint = [NSLayoutConstraint constraintWithItem:middlebox
                                                                                attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 0
                                                                                 constant:40];

    middleBoxConstraint2.active = YES;
    heightmiddleBoxConstraint.active = YES;
    widthmiddleBoxConstraint.active = YES;
    middleBoxConstraint.active = YES;
    
    
 //AUTO LAYOUT FOR BOX 2
    UIView *topbox = [[UIView alloc] initWithFrame:CGRectZero];
    topbox.backgroundColor = [UIColor blueColor];
    topbox.translatesAutoresizingMaskIntoConstraints = false;
    [framingView addSubview:topbox];
    
    NSLayoutConstraint *topBoxConstraint = [NSLayoutConstraint constraintWithItem:topbox
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:framingView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier: 0.25
                                                                            constant:0];
    
    NSLayoutConstraint *topboxConstraint2 = [NSLayoutConstraint constraintWithItem:topbox
                                                                            attribute:NSLayoutAttributeCenterX
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:framingView
                                                                            attribute:NSLayoutAttributeCenterX
                                                                           multiplier: 1.0
                                                                             constant:0];
    
    NSLayoutConstraint *widthTopBoxConstraint = [NSLayoutConstraint constraintWithItem:topbox
                                                                                attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 0
                                                                                 constant:40];
    
    NSLayoutConstraint *heightTopBoxConstraint = [NSLayoutConstraint constraintWithItem:topbox
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier: 0
                                                                                  constant:40];
    
    topBoxConstraint.active = YES;
    topboxConstraint2.active = YES;
    widthTopBoxConstraint.active = YES;
    heightTopBoxConstraint.active = YES;

    
    
    
    
//Autolayout Bottom Box
    
    UIView *bottombox = [[UIView alloc] initWithFrame:CGRectZero];
    bottombox.backgroundColor = [UIColor blueColor];
    bottombox.translatesAutoresizingMaskIntoConstraints = false;
    [framingView addSubview:bottombox];
    
    NSLayoutConstraint *bottomBoxConstraint = [NSLayoutConstraint constraintWithItem:bottombox
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:framingView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier: 1.60
                                                                         constant:0];
    
    NSLayoutConstraint *bottomBoxConstraint2 = [NSLayoutConstraint constraintWithItem:bottombox
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:framingView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier: 1.0
                                                                          constant:0];
    NSLayoutConstraint *widthBottomBoxConstraint = [NSLayoutConstraint constraintWithItem:bottombox
                                                                             attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier: 0
                                                                              constant:40];
    
    NSLayoutConstraint *heightBottomBoxConstraint = [NSLayoutConstraint constraintWithItem:bottombox
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier: 0
                                                                               constant:40];
    
    
    bottomBoxConstraint.active = YES;
    bottomBoxConstraint2.active = YES;
    widthBottomBoxConstraint.active =YES;
    heightBottomBoxConstraint.active = YES;
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */




- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
