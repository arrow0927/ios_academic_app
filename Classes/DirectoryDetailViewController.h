#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface DirectoryDetailViewController : UIViewController 
{
	IBOutlet UISegmentedControl *segControl;
	IBOutlet UITextView *txtView;
	IBOutlet UIWebView *webView;
	IBOutlet MKMapView *mapView;
	IBOutlet UIImageView *academicImage;

}
@property (nonatomic,retain)IBOutlet UISegmentedControl *segControl;
@property (nonatomic,retain)IBOutlet UITextView *txtView;
@property (nonatomic,retain)IBOutlet UIWebView *webView;
@property (nonatomic,retain)IBOutlet MKMapView *mapView;
@property (nonatomic,retain)IBOutlet UIImageView *academicImage;
-(IBAction)segControlPressed:(id)sender;


@end
