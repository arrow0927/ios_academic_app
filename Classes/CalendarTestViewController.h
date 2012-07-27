#import <UIKit/UIKit.h>
#import "KLCalendarView.h"
#import "CheckmarkTile.h"
//==============================================================================
@interface CalendarTestViewController : UIViewController <KLCalendarViewDelegate, UITableViewDelegate, UITableViewDataSource> 
{
	KLCalendarView *calendarView;
	KLTile *currentTile;
	UITableView *myTableView;
	NSMutableArray *tableViewData;
	KLTile *tile;
	BOOL shouldPushAnotherView;
}
//==============================================================================
@end

