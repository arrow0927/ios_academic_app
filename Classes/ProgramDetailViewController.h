#import <UIKit/UIKit.h>


@interface ProgramDetailViewController : UIViewController 
{
	IBOutlet UITextView *ProgramDetailTextView;
}

@property(nonatomic, retain)IBOutlet UITextView *ProgramDetailTextView;
-(IBAction)mapButtonPressed: (id)sender;

@end
