#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ProgramsViewController.h"
#import "FacultiesViewController.h"
#import "AcademicSegmentedViewController.h"
@interface AcademicsViewController : UITableViewController 
{
	NSMutableArray *departments;
	NSDictionary *academics2;
	NSMutableArray *keys;
	UITableView *table;
}
//==============================================================================
@property(nonatomic, retain) NSMutableArray *departments;
@property(nonatomic, retain) NSDictionary *academics2;
@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain)  NSMutableArray *keys;
//==============================================================================
@end
