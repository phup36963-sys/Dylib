#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"netping"];

    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:self.webView];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"html"];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        [self.webView loadFileURL:url allowingReadAccessToURL:url];
    }
}

#pragma mark - HTML Bridge

- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {

    if ([message.name isEqualToString:@"netping"]) {
        NSLog(@"📩 HTML gửi: %@", message.body);
    }
}

@end