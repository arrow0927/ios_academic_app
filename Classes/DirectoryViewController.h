#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//==============================================================================
@interface DirectoryViewController : UITableViewController 
<UISearchBarDelegate, UISearchDisplayDelegate>
{
	UITableView *table;
	UISearchBar *search;
	NSDictionary *allNames;
	NSMutableDictionary *names;
	NSMutableArray *keys;
	BOOL isSearching;
	UISearchDisplayController *searchDisplayController;
}
//==============================================================================
@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) IBOutlet UISearchBar *search;
@property (nonatomic, retain) NSDictionary *allNames;
@property (nonatomic, retain) NSMutableDictionary *names;
@property (nonatomic, retain) NSMutableArray *keys;
@property (nonatomic, retain) UISearchDisplayController *searchDisplayController;
//==============================================================================
-(void)resetSearch;
-(void)handleSearchForTerm:(NSString *)searchTerm;
//==============================================================================
@end
