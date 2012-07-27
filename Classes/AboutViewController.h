#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
//==============================================================================
@interface AboutViewController : UIViewController 
{
	IBOutlet UISegmentedControl *segControl;
	IBOutlet UITextView *txtView;
	IBOutlet UIWebView *webView;
	IBOutlet MKMapView *mapView;
	IBOutlet UIImageView *aboutImage;
}
//==============================================================================
@property (nonatomic,retain)IBOutlet UISegmentedControl *segControl;
@property (nonatomic,retain)IBOutlet UITextView *txtView;
@property (nonatomic,retain)IBOutlet UIWebView *webView;
@property (nonatomic,retain)IBOutlet MKMapView *mapView;
@property (nonatomic,retain)IBOutlet UIImageView *aboutImage;
//==============================================================================
-(IBAction)segControlPressed:(id)sender;
//==============================================================================
@end
