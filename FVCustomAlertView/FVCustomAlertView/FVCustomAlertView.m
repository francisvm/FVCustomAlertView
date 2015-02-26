//
//  FVCustomAlertView.m
//  FVCustomAlertView
//
//  Created by Francis Visoiu Mistrih on 13/07/2014.
//  Copyright (c) 2014 Francis Visoiu Mistrih. All rights reserved.
//

#import "FVCustomAlertView.h"

static const NSInteger kInsetValue = 6;
static const NSUInteger kFinalViewTag = 1337;
static const NSUInteger kAlertViewTag = 1338;
static const CGFloat kFadeOutDuration = 0.5f;
static const CGFloat kFadeInDuration = 0.2f;
static const CGFloat kActivityIndicatorSize = 50;
static const CGFloat kOtherIconsSize = 30;

@interface FVCustomAlertView ()

+ (NSArray *)setupCustomActivityIndicator;
+ (UIView *)contentViewFromType:(FVAlertType)type;
+ (void)fadeOutView:(UIView *)view completion:(void (^)(BOOL finished))completion;
+ (void)hideAlertByTap:(UITapGestureRecognizer *)sender;

@end

static UIView *currentView = nil;

@implementation FVCustomAlertView

+ (UIView *)currentView
{
    return currentView;
}

+ (void)showAlertOnView:(UIView *)view
              withTitle:(NSString *)title
             titleColor:(UIColor *)titleColor
                  width:(CGFloat)width
                 height:(CGFloat)height
                   blur:(BOOL)blur
        backgroundImage:(UIImage *)backgroundImage
        backgroundColor:(UIColor *)backgroundColor
           cornerRadius:(CGFloat)cornerRadius
            shadowAlpha:(CGFloat)shadowAlpha
                  alpha:(CGFloat)alpha
            contentView:(UIView *)contentView
                   type:(FVAlertType)type
               allowTap:(BOOL)tap
{
    if ([view viewWithTag:kFinalViewTag]) {
        //don't allow 2 alerts on the same view
        NSLog(@"Can't add two FVCustomAlertViews on the same view. Hide the current view first.");
        return;
    }

    //get window size and position
    CGRect windowRect = [[UIScreen mainScreen] bounds];

    //create the final view with a special tag
    UIView *resultView = [[UIView alloc] initWithFrame:windowRect];
    resultView.tag = kFinalViewTag; //set tag to retrieve later
    resultView.alpha = 0.0f;

    if (blur) {
      UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

      UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
      visualEffectView.frame = windowRect;
      [resultView addSubview:visualEffectView];
    }

    //create shadow view by adding a black background with custom opacity
    UIView *shadowView = [[UIView alloc] initWithFrame:windowRect];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = shadowAlpha;
    [resultView addSubview:shadowView];

    //create the main alert view centered
    //with custom width and height
    //and custom background
    //and custom corner radius
    //and custom opacity
    UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(windowRect.size.width/2 - width/2,
                                                                 windowRect.size.height/2 - height/2,
                                                                 width, height)];
    alertView.tag = kAlertViewTag; //set tag to retrieve later

    //set background color
    //if a background image is used, use the image instead.
    alertView.backgroundColor = backgroundColor;
    if (backgroundImage) {
        alertView.backgroundColor = [[UIColor alloc] initWithPatternImage:backgroundImage];
    }
    alertView.layer.cornerRadius = cornerRadius;
    alertView.alpha = alpha;

    //create the title label centered with multiple lines
    //and custom color
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = titleColor;

    //set the number of lines to 0 (unlimited)
    //set a maximum size to the label
    //then get the size that fits the maximum size
    titleLabel.numberOfLines = 0;
    CGSize requiredSize = [titleLabel sizeThatFits:CGSizeMake(width - kInsetValue, height - kInsetValue)];
    titleLabel.frame = CGRectMake(width/2 - requiredSize.width / 2, kInsetValue, requiredSize.width, requiredSize.height);
    [alertView addSubview:titleLabel];

    //check wether the alert is of custom type or not
    //if it is, set the custom view
    UIView *content = type == FVAlertTypeCustom ? contentView : [self contentViewFromType:type];

    content.frame = CGRectApplyAffineTransform(content.frame, CGAffineTransformMakeTranslation(width/2 - content.frame.size.width/2, titleLabel.frame.origin.y + titleLabel.frame.size.height + kInsetValue));

    [alertView addSubview:content];

    [resultView addSubview:alertView];

    if (tap) {
        //tap the alert view to hide and remove it from the superview
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:[FVCustomAlertView class] action:@selector(hideAlertByTap:)];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [resultView addGestureRecognizer:tapGesture];
    }

    [view addSubview:resultView];
    [self fadeInView:resultView completion:nil];
    currentView = view;
}

+ (void)showDefaultLoadingAlertOnView:(UIView *)view withTitle:(NSString *)title withBlur:(BOOL)blur allowTap:(BOOL)tap {
    [self showAlertOnView:view
                withTitle:title
               titleColor:[UIColor whiteColor]
                    width:100.0
                   height:100.0
                     blur:blur
          backgroundImage:nil
          backgroundColor:[UIColor blackColor]
             cornerRadius:10.0
              shadowAlpha:0.1
                    alpha:0.8
              contentView:nil
                     type:FVAlertTypeLoading
                 allowTap:tap];
}

+ (void)showDefaultDoneAlertOnView:(UIView *)view withTitle:(NSString *)title withBlur:(BOOL)blur allowTap:(BOOL)tap {
    [self showAlertOnView:view
                withTitle:title
               titleColor:[UIColor whiteColor]
                    width:100.0
                   height:100.0
                     blur:blur
          backgroundImage:nil
          backgroundColor:[UIColor blackColor]
             cornerRadius:10.0
              shadowAlpha:0.1
                    alpha:0.8
              contentView:nil
                     type:FVAlertTypeDone
                 allowTap:tap];
}

+ (void)showDefaultErrorAlertOnView:(UIView *)view withTitle:(NSString *)title withBlur:(BOOL)blur allowTap:(BOOL)tap {
    [self showAlertOnView:view
                withTitle:title
               titleColor:[UIColor whiteColor]
                    width:100.0
                   height:100.0
                     blur:blur
          backgroundImage:nil
          backgroundColor:[UIColor blackColor]
             cornerRadius:10.0
              shadowAlpha:0.1
                    alpha:0.8
              contentView:nil
                     type:FVAlertTypeError
                 allowTap:tap];
}

+ (void)showDefaultWarningAlertOnView:(UIView *)view withTitle:(NSString *)title withBlur:(BOOL)blur allowTap:(BOOL)tap {
    [self showAlertOnView:view
                withTitle:title
               titleColor:[UIColor whiteColor]
                    width:100.0
                   height:100.0
                     blur:blur
          backgroundImage:nil
          backgroundColor:[UIColor blackColor]
             cornerRadius:10.0
              shadowAlpha:0.1
                    alpha:0.8
              contentView:nil
                     type:FVAlertTypeWarning
                 allowTap:tap];
}

+ (NSArray *)setupCustomActivityIndicator {
    NSMutableArray *array = [NSMutableArray array];
    //iterate through all the images and add it to the array for the animation
    for (int i = 1; i <= 20; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [array addObject:image];
    }
    return array;
}

+ (UIView *)contentViewFromType:(FVAlertType)type {
    UIImageView *content = [[UIImageView alloc] init];
    //generate default content views based on the type of the alert
    switch (type) {
        case FVAlertTypeLoading:
        {
            content.frame = CGRectMake(0, 0, kActivityIndicatorSize, kActivityIndicatorSize);
            content.animationDuration = 0.7;
            content.animationImages = [self setupCustomActivityIndicator];
            [content startAnimating];
        }
            break;
        case FVAlertTypeDone:
        {
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize);
            content.image = [UIImage imageNamed:@"checkmark"];
        }
            break;
        case FVAlertTypeError:
        {
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize);
            content.image = [UIImage imageNamed:@"cross"];
        }
            break;
        case FVAlertTypeWarning:
        {
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize);
            content.image = [UIImage imageNamed:@"warning"];
        }
            break;
        default:
            //FVAlertTypeCustom never reached
            break;
    }

    return content;
}

+ (void)fadeInView:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:kFadeInDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [view setAlpha:1.0];
                     }
                     completion:completion];
}

+ (void)fadeOutView:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:kFadeOutDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [view setAlpha:0.0];
                     }
                     completion:completion];
}

+ (void)hideAlertFromView:(UIView *)view fading:(BOOL)fading {
    if (fading) {
        [self fadeOutView:[view viewWithTag:kFinalViewTag] completion:^(BOOL finished) {
            [[view viewWithTag:kFinalViewTag] removeFromSuperview];
        }];
    } else {
        [[view viewWithTag:kFinalViewTag] removeFromSuperview];
    }
    currentView = nil;
}

+ (void)hideAlertByTap:(UITapGestureRecognizer *)sender {
    //fade out and then remove from superview
    [self fadeOutView:sender.view
           completion:^(BOOL finished) {
               [[sender.view viewWithTag:kFinalViewTag] removeFromSuperview];
               currentView = nil;
           }];
}

@end
