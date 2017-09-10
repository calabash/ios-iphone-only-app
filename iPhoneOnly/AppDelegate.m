#import "AppDelegate.h"
#import "MBFingerTipWindow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window {
  if (!_window) {
    MBFingerTipWindow *ftWindow = [[MBFingerTipWindow alloc]
                                   initWithFrame:[[UIScreen mainScreen] bounds]];
    NSArray *arguments = [[NSProcessInfo processInfo] arguments];
    ftWindow.alwaysShowTouches = [arguments containsObject:@"FINGERTIPS"];
    _window = ftWindow;
  }
  return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
