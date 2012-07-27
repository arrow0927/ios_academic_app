#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ProgDetailMapViewController : UIViewController 
{
	IBOutlet MKMapView *mapView;
}
@property(nonatomic, retain) IBOutlet MKMapView *mapView;

@end
