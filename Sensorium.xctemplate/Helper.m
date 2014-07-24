//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_classPrefix:identifier___Helper.h"

@implementation ___VARIABLE_classPrefix:identifier___Helper

#pragma mark - NSUserDefaults

+ (void)setHighScore:(int)score
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:score] forKey:highScore];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"Saved high score: %d",score);
}

+ (int)getHighScore
{
    int highScoreInt = [[[NSUserDefaults standardUserDefaults] objectForKey:highScore] intValue];
    NSLog(@"The high score is %d",highScoreInt);
    return highScoreInt;
}

+ (NSString *)getHighScoreString
{
    int highScoreInt = [[[NSUserDefaults standardUserDefaults] objectForKey:highScore] intValue];
    NSString *scoreString = [NSString stringWithFormat:@"High Score: %d",highScoreInt];
    return scoreString;
}

+ (void)addToRunningScore:(int)score
{
    int currentScore = [[[NSUserDefaults standardUserDefaults] objectForKey:runningScore] integerValue];
    score += currentScore;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:score] forKey:runningScore];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (int)getRunningScore
{
    int runningScoreInt = [[[NSUserDefaults standardUserDefaults] objectForKey:runningScore] intValue];
    NSLog(@"The high score is %d",runningScoreInt);
    return runningScoreInt;
}

+ (NSString *)getRunningScoreString
{
    int runningScoreInt = [[[NSUserDefaults standardUserDefaults] objectForKey:runningScore] intValue];
    NSString *scoreString = [NSString stringWithFormat:@"Score: %d",runningScoreInt];
    return scoreString;
}

+ (void)incrementLaunchCount
{
    NSUserDefaults *countDefaults;
    long launchCountLong;
    
    countDefaults = [NSUserDefaults standardUserDefaults];
    launchCountLong = [countDefaults integerForKey:launchCount] + 1;
    [countDefaults setInteger:launchCountLong forKey:launchCount];
    [countDefaults synchronize];
}

+ (void)setStringForKey:(NSString*)value withKey:(NSString*)key
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults)
    {
		[standardUserDefaults setObject:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (NSString*)getStringForKey:(NSString*)key
{
    NSString* val = @"";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) val = [standardUserDefaults stringForKey:key];
    if (val == NULL) val = @"";
    return val;
}

+ (void)setIntForKey:(NSInteger)value withKey:(NSString*)key
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults)
    {
		[standardUserDefaults setInteger:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (NSInteger)getIntForkey:(NSString *)key
{
    NSInteger val = 0;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) val = [standardUserDefaults integerForKey:key];
    return val;
}

+ (void)setDictForKey:(NSDictionary*)value :(NSString*)key
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults)
    {
		[standardUserDefaults setObject:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (NSDictionary*)getDictForKey:(NSString*)key
{
    NSDictionary* val = nil;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) val = [standardUserDefaults dictionaryForKey:key];
    return val;
}

+ (void)setArrayForKey:(NSArray*)value :(NSString*)key
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults)
    {
		[standardUserDefaults setObject:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (NSArray*)getArrayForKey:(NSString*)key
{
    NSArray* val = nil;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) val = [standardUserDefaults arrayForKey:key];
    return val;
}

+ (void)setBoolForKey:(BOOL)value :(NSString*)key
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults)
    {
		[standardUserDefaults setBool:value forKey:key];
		[standardUserDefaults synchronize];
	}
}

+ (BOOL)getBoolForKey:(NSString*)key
{
    BOOL val = FALSE;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) val = [standardUserDefaults boolForKey:key];
    return val;
}

#pragma mark - Interface

+ (CGRect)randomFrameForButton:(UIButton*)button inView:(UIView *)view
{
    int randomHeightInt = roundf(view.frame.size.height - button.frame.size.height)-50;
    int randomWidthInt = roundf(view.frame.size.width - button.frame.size.width) - 20;
    int randomHeight = arc4random() %randomHeightInt + 50;
    int randomWidth = arc4random() % randomWidthInt + 20;
    
    CGRect frame = CGRectMake(randomWidth,
                              randomHeight,
                              button.frame.size.width,
                              button.frame.size.height );
    return frame;
}

+ (void)setTitle:(NSString *)string forButton:(UIButton *)button
{
    [button setTitle:string forState:UIControlStateNormal];
}


+ (void)setLabel:(UILabel*)label textValue:(NSString *)text
{
    label.text = [NSString stringWithFormat:@"%@",text];
}

+ (void)hideButton:(UIButton *)button
{
    button.hidden = YES;
}

+ (void)showButton:(UIButton *)button
{
    button.hidden = NO;
}

+ (void)setViewColor:(UIColor *)color
{
    SENAppDelegate *appDelegate = (SENAppDelegate *)[[UIApplication sharedApplication] delegate];
    SENViewController *mainController = (SENViewController *) appDelegate.window.rootViewController;
    mainController.view.backgroundColor = color;
}

#pragma mark - Math

+ (int)getRandomInt:(int)upperLimit
{
    int colourNumber = abs((int)arc4random() % upperLimit);
    return colourNumber;
}

+ (float)getRandomFloat:(int)upperLimit
{
    float colourNumber = abs(arc4random() % upperLimit);
    return colourNumber;
}

+ (float)randomFloatInRange:(float)Min :(float)Max;
{
    float rand = Min+(Max-Min)*((float)arc4random())/ULONG_MAX;
    //    NSLog(@"float %f",rand);
    return rand;
}

+ (CGFloat)randomCGFloatInRange:(float)Min :(float)Max;
{
    CGFloat rand = Min+(Max-Min)*((CGFloat)arc4random())/ULONG_MAX;
    return rand;
}

+ (int)randomIntInRange:(int)Min :(int)Max;
{
    //    int rand = Min+(Max-Min)*((int)arc4random())/ULONG_MAX;
    int rand = (arc4random() % Max) + 1;
    //    NSLog(@"int %d",rand);
    return rand;
}

+ (BOOL)randomBool
{
    int rand = (arc4random() % 2) - 1;
    BOOL result;
    if (rand == 0) {
        result = NO;
    } else {
        result = YES;
    }
    //    NSLog(@"bool %hhd",result);
    return result;
}

+ (float)mapFloatValueWithInputMin:(float)inputMin withInputMax:(float)inputMax withOutputMin:(float)outputMin withOutputMax:(float)outputMax withValue:(float)value
{
    float val = outputMin + (outputMax - outputMin) * (value - inputMin) / (inputMax - inputMin);
    return val;
}

+ (float)mapFloatRange:(float)value withInMin:(float)inputMin withInMax:(float)inputMax withOutMin:(float)outputMin withOutMax:(float)outputMax
{
    BOOL clamp = false;
    
	if (fabs(inputMin - inputMax) < FLT_EPSILON){
		return outputMin;
	} else {
		float outVal = ((value - inputMin) / (inputMax - inputMin) * (outputMax - outputMin) + outputMin);
		if( clamp ){
			if(outputMax < outputMin){
				if( outVal < outputMax )outVal = outputMax;
				else if( outVal > outputMin )outVal = outputMin;
			}else{
				if( outVal > outputMax )outVal = outputMax;
				else if( outVal < outputMin )outVal = outputMin;
			}
		}
		return outVal;
	}
}

#pragma mark - Device

+ (void)preventSleep
{
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

+ (void)allowSleep
{
    [UIApplication sharedApplication].idleTimerDisabled = NO;
}

+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void)setBadgeNumber:(int)num
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = num;
}

+ (void)createSoundFromFileNamed:(NSString*)filename withSoundID:(SystemSoundID*)ID
{
    NSString *popPath = [[NSBundle mainBundle]
                         pathForResource:filename ofType:@"mp3"];
    NSURL *popPathURL = [NSURL fileURLWithPath:popPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)popPathURL,
                                     ID);
}

+ (void)playSound:(SystemSoundID*)ID
{
    AudioServicesPlaySystemSound(*ID);
}

+ (BOOL)checkIfOnIpad
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return TRUE;
    } else {
        return FALSE;
    }
}

#pragma mark - Networking

//+ (NSString *)getDeviceIPAddress
//{
//    NSString *address = @"error";
//    struct ifaddrs *interfaces = NULL;
//    struct ifaddrs *temp_addr = NULL;
//    int success = 0;
//    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    if (success == 0) {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        while(temp_addr != NULL) {
//            if(temp_addr->ifa_addr->sa_family == AF_INET) {
//                // Check if interface is en0 which is the wifi connection on the iPhone
//                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
//                    // Get NSString from C String
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//                }
//            }
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    // Free memory
//    freeifaddrs(interfaces);
//    return address;
//
//}

# pragma mark - App Meta

+ (NSArray *)getAppMetaData
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *build = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *appName = [[[NSBundle mainBundle] infoDictionary]  objectForKey:@"CFBundleName"];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    //    return [NSString stringWithFormat:@"App:%@, identifier:%@, version:%@, build:%@", appName, bundleIdentifier, version, build];
    
    NSArray *meta = @[version, build, appName, bundleIdentifier];
    return meta;
}





@end