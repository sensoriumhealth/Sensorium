//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "___VARIABLE_classPrefix:identifier___AppDelegate.h"
#import "___VARIABLE_classPrefix:identifier___ViewController.h"
#import "___VARIABLE_classPrefix:identifier___Constants.h"


@interface ___VARIABLE_classPrefix:identifier___Helper : NSObject

#pragma mark - NSUserDefaults
+ (void)setHighScore:(int)score;
+ (int)getHighScore;
+ (NSString *)getHighScoreString;
+ (void)incrementLaunchCount;
+ (void)addToRunningScore:(int)score;
+ (int)getRunningScore;
+ (NSString *)getRunningScoreString;
+ (void)setStringForKey:(NSString*)value withKey:(NSString*)key;
+ (NSString*)getStringForKey:(NSString*)key;
+ (void)setIntForKey:(NSInteger)value withKey:(NSString*)key;
+ (NSInteger)getIntForkey:(NSString *)key;
+ (void)setDictForKey:(NSDictionary*)value :(NSString*)key;
+ (NSDictionary*)getDictForKey:(NSString*)key;
+ (void)setArrayForKey:(NSArray*)value :(NSString*)key;
+ (NSArray*)getArrayForKey:(NSString*)key;
+ (void)setBoolForKey:(BOOL)value :(NSString*)key;
+ (BOOL)getBoolForKey:(NSString*)key;

#pragma mark - Math
+ (int)getRandomInt:(int)upperLimit;
+ (float)getRandomFloat:(int)upperLimit;

+ (float)randomFloatInRange:(float)Min :(float)Max;
+ (CGFloat)randomCGFloatInRange:(float)Min :(float)Max;
+ (int)randomIntInRange:(int)Min :(int)Max;
+ (BOOL)randomBool;
+ (float)mapFloatValueWithInputMin:(float)inputMin withInputMax:(float)inputMax withOutputMin:(float)outputMin withOutputMax:(float)outputMax withValue:(float)value;
+ (float)mapFloatRange:(float)value withInMin:(float)inputMin withInMax:(float)inputMax withOutMin:(float)outputMin withOutMax:(float)outputMax;

#pragma mark - Interface
+ (void)setLabel:(UILabel*)label textValue:(NSString *)text;
+ (CGRect)randomFrameForButton:(UIButton*)button inView:(UIView *)view;
+ (void)setTitle:(NSString *)string forButton:(UIButton *)button;
+ (void)hideButton:(UIButton *)button;
+ (void)showButton:(UIButton *)button;
+ (void)setViewColor:(UIColor *)color;

#pragma mark - Device
+ (void)allowSleep;
+ (void)preventSleep;
+ (void)vibrate;
+ (void)setBadgeNumber:(int)num;
+ (BOOL)checkIfOnIpad;

/* don't forget to send 'references' not 'pointers.
 e.g. [CodeCamp createSoundFromFileNamed:@"filename" withSoundID:&(sound)];
 */
+ (void)createSoundFromFileNamed:(NSString*)filename withSoundID:(SystemSoundID*)ID;
+ (void)playSound:(SystemSoundID*)ID;

# pragma mark - Networking
//+ (NSString *)getDeviceIPAddress;

# pragma mark - App Meta
+ (NSArray *)getAppMetaData;
@end

