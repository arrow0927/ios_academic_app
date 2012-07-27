#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AboutMapViewController : UIViewController 
{
	IBOutlet MKMapView *mapView;
}

@property(nonatomic, retain) IBOutlet MKMapView *mapView;
-(IBAction)webButtonPressed: (id)sender;

@end
