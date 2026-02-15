#import "AppDelegate.h"
#import "ViewController.h"
#import <dlfcn.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];

    // 🔥 Load dylib
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NetPingPro" ofType:@"dylib"];
    if (path) {
        void *handle = dlopen([path UTF8String], RTLD_NOW);
        if (handle) {
            NSLog(@"✅ NetPingPro.dylib loaded");
        } else {
            NSLog(@"❌ Dylib load failed");
        }
    }

    return YES;
}

@end