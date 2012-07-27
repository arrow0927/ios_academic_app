#import <UIKit/UIKit.h>


@interface VideoTableViewCell : UITableViewCell 
{
	UIWebView *webView;
	UILabel *label1;
	UILabel *label2;
	UITableViewCell *videoTableViewCell;
}

@property(nonatomic, retain)UIWebView *webView;
@property(nonatomic, retain)UILabel *label1;
@property(nonatomic, retain)UILabel *label2;
@property(nonatomic, retain)UITableViewCell *videoTableViewCell;
@end
