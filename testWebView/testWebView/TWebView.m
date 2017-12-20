//
//  TWebView.m
//  testWebView
//
//  Created by admin on 11/12/2017.
//  Copyright © 2017 gome. All rights reserved.
//

#import "TWebView.h"

@interface TWebView() <WKNavigationDelegate>

@end


@implementation TWebView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        
        WKWebView* wv = [[WKWebView alloc] init];
        wv.navigationDelegate = self;
        [self addSubview:wv];
        
        self.webView = wv;
        
        if (self.webView) {
            NSURL* url = [NSURL URLWithString:@"https://m.hao123.com/novel/"];
            if (url) {
                NSURLRequest* req = [NSURLRequest requestWithURL:url];
                if (req) {
                    [self.webView loadRequest:req];
                }
            }
        }
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.bounds.size;
    self.webView.frame = CGRectMake(0, 60, size.width, size.height - 120);
}

#pragma mark-
#pragma mark delegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSString* doc = @"document.body.outerHTML";
    [webView evaluateJavaScript:doc
                     completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
                         if (error) {
                             NSLog(@"JSError:%@",error);
                         }
                         NSLog(@"html:%@",htmlStr);
                     }];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    
}

@end
