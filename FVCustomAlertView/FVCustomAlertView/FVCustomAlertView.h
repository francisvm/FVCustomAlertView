//
//  FVCustomAlertView.h
//  FVCustomAlertView
//
//  Created by Francis Visoiu Mistrih on 13/07/2014.

// This code is distributed under the terms and conditions of the MIT license.

// Copyright (c) 2014 Francis Visoiu Mistrih.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

typedef enum {
    /** A view with a UIActivityIndicator and "Loading..." title. */
    FVAlertTypeLoading,
    /** A view with a checkmark and "Done" title. */
    FVAlertTypeDone,
    /** A view with a cross and "Error" title. */
    FVAlertTypeError,
    /** A view with an exclamation point and "Warning" title. */
    FVAlertTypeWarning,
    /** A view with a background shadow. */
    FVAlertTypeCustom,
} FVAlertType;

/**
 * Displays a custom alert view. It can contain either a title or a custom UIView
 * The view is customisable and has 4 default modes:
 * - FVAlertTypeLoading - displays a UIActivityIndicator
 * - FVAlertTypeDone/Error/Warning - displays a checkmark/cross/exclamation point
 * - FVAlertTypeCustom - lets the user to customise the view
 */

@interface FVCustomAlertView : UIView


/**
 * Creates a new view and adds it to the view. Use hideAlertFromView to hide it.
 * Adds the view on top of all of the views.
 * Can't create more than one view at a time.
 * @param view The view that the alertView will be added to
 * @param title The title shown on the top of the alert view
 * @param titleColor The title text color
 * @param width The width of the view
 * @param height The height of the view
 * @param backgroundImage If set, will set the background as a tiled image. Background color will be unavalible.
 * @param backgroundColor Color of the background. Used if the image is not set.
 * @param cornerRadius The radius of the rounded corners
 * @param shadowAlpha The background shadow opacity
 * @param alpha The opacity of the alert view
 * @param contentView The content of the view. Can be nil and choose a special type. Can be filled with a UIView or other derived classes.
 * @param type
 */
+ (void)showAlertOnView:(UIView *)view
              withTitle:(NSString *)title
             titleColor:(UIColor *)titleColor
                  width:(CGFloat)width
                 height:(CGFloat)height
        backgroundImage:(UIImage *)backgroundImage
        backgroundColor:(UIColor *)backgroundColor
           cornerRadius:(CGFloat)cornerRadius
            shadowAlpha:(CGFloat)shadowAlpha
                  alpha:(CGFloat)alpha
            contentView:(UIView *)contentView
                   type:(FVAlertType)type;

/**
 * Creates a default loading view
 * with the activity indicator from pictures 1.png 2.png...20.png
 * @param view The view that the alertView will be added to
 * @param title The title shown on the top of the alert view
 */
+ (void)showDefaultLoadingAlertOnView:(UIView *)view withTitle:(NSString *)title;

/**
 * Creates a default done view
 * with a checkmark and a title
 * @param view The view that the alertView will be added to
 * @param title The title shown on the top of the alert view
 */
+ (void)showDefaultDoneAlertOnView:(UIView *)view withTitle:(NSString *)title;

/**
 * Creates a default done view
 * with a cross (X) and a title
 * @param view The view that the alertView will be added to
 * @param title The title shown on the top of the alert view
 */
+ (void)showDefaultErrorAlertOnView:(UIView *)view withTitle:(NSString *)title;

/**
 * Creates a default done view
 * with an exclamation point (!) and a title
 * @param view The view that the alertView will be added to
 * @param title The title shown on the top of the alert view
 */
+ (void)showDefaultWarningAlertOnView:(UIView *)view withTitle:(NSString *)title;

/**
 * Hides the active view on the specified view.
 * @param view The view that the alertView is already added to
 * @param fading If set to YES, an animation will perform the hiding of the view as a fading effect.
 */
+ (void)hideAlertFromView:(UIView *)view fading:(BOOL)fading;

@end
